//
//  GLDTween.swift
//  GLDTween
//
//  Created by 深津 貴之 on 2014/09/26.
//  Copyright (c) 2014年 THE GUILD. All rights reserved.
//

import UIKit


//GLDTweenのパラメータとして使われる予約語
public enum GLDTweenReservedProperty:String{
    case Duration = "duration"
    case Delay = "delay"
    case Rounded = "rounded"
    case Easing = "easing"
    case Start = "start"
    case Completion = "completion"
}

public class GLDTween: NSObject {
    // MARK: - Props
    let reservedPropName:Dictionary<String,Bool> = ["duration":true, "delay":true, "rounded":true, "easing":true, "start":true, "completion":true]
    let framerate:Double = 60.0
    let defaultEasing:String = GLDEaseTypeNone
    var currentTime:Double = 0
    var timer:NSTimer!
    var tweens:Array<GLDTweenData>!
    var easings:Dictionary<String, GLDEasingFunction>!
    var castHelpers:Dictionary<String, GLDTweenCastHelper>!
    var specialProperties:Dictionary<String, GLDSpecialPropertyProxy>!
    
    
    // MARK: - Public Class Method
    
    /**
     ターゲットに対するアニメーションを実行する。
     paramsで指定できるパラメーターについては別途参照。
     :param: target アニメーションの対象となるインスタンス。UIViewなど
     :param: params アニメーションで動かすプロパティや時間などを格納したDictionary
    */
    public class func addTween(target:NSObject, _ params:Dictionary<String, Any>){
        GLDTween.sharedEngine.addTween(target, params: params)
    }
    
    /**
     全てのアニメーションを一時停止する。
     :returns: 一時停止されたアニメーションがあった場合はTrueを返す。
    */
    public class func pauseAllTweens() -> Bool{
        return GLDTween.sharedEngine.pauseAllTweens()
    }
    
    
    /**
     指定したターゲットに関するアニメーションを削除する。
     :returns: 削除されたアニメーションがあった場合はTrueを返す。
    */
    public class func removeTween(target:AnyObject) -> Bool{
        return GLDTween.sharedEngine.removeTween(target)
    }
    
    
    /**
     指定したターゲットの特定のプロパティに関するアニメーションを削除する。
     プロパティが削除された場合、結びつけられていた完了時クロージャなども削除される。
     :returns: 削除されたアニメーションがあった場合はTrueを返す。
    */
    public class func removeTween(target:AnyObject, props:Array<String>) -> Bool{
        return GLDTween.sharedEngine.removeTween(target, props: props)
    }
    
    
    /**
     全てのアニメーションを削除する
     :return: 削除されたアニメーションがあった場合はtrueを返す。
    */
    public class func removeAllTweens() -> Bool{
        return GLDTween.sharedEngine.removeAllTweens()
    }
    
    
    /**
     指定したターゲットの一時停止中のアニメーションを再開する
     :return: 再開したアニメーションがあった場合はTrueを返す
    */
    public class func resumeTween(target:AnyObject) -> Bool{
        return GLDTween.sharedEngine.resumeTween(target)
    }
    
    
    /**
    全ての一時停止中のアニメーションを再開する
    :return: 再開したアニメーションがあった場合はTrueを返す
    */
    public class func resumeAllTweens() -> Bool{
        return GLDTween.sharedEngine.resumeAllTweens()
    }
    
    
    
    /**
     アニメーションのイージングをプラグインとして登録する。
     登録するイージングカーブは、GLDEasingFunctionプロトコルをサポートする必要がある
     :param: transition イージング計算を扱うGLDEasingFunctionプロトコルを実装したオブジェクト
     :param: name イージングを指定するときの名称。
    */
    public class func registerEasing(transition: GLDEasingFunction, name:String){
        GLDTween.sharedEngine.registerEasing(transition, name:name)
    }
    
    
    
    
    // MARK: - Private
    
    private func addTween(target:NSObject, params:Dictionary<String, Any>){
        let duration:Double = (params["duration"] != nil) ? convertDouble(params["duration"]!) : 0.0
        let delay:Double = (params["delay"] != nil) ? convertDouble(params["delay"]!) : 0.0
        
        var tweenData:GLDTweenData = GLDTweenData()
        tweenData.target = target
        
        //遅延の登録
        tweenData.timeStart = self.currentTime + delay
        tweenData.timeComplete = self.currentTime + delay + duration

        //イージング関数の登録
        if let ieExist = params["easing"]{
            tweenData.easing = params["easing"]! as String
        }else{
            tweenData.easing = defaultEasing
        }

        //開始クロージャの登録
        if let isExist = params["start"]{
            tweenData.start = (params["start"]! as GLDTweenClosure).closure
        }
        
        //終了クロージャの登録
        if let isExist = params["completion"]{
            tweenData.completion = (params["completion"]! as GLDTweenClosure).closure
        }
        
        
        //アニメーションする変数を注入
        for (propName:String, value:Any) in params{
            //数字の場合だけ内部系をDoubleに統一する
            var value2:Any = value
            if(value is CGFloat){
                value2 = Double(value as CGFloat)
            }else if(value is Int){
                value2 = Double(value as Int)
            }
            
            var type:String = GLDTweenUtil.typeOfValue(value2)  //valueの型を取得
            if let val = reservedPropName[propName] {
                //名称が予約後の場合は登録しない
            } else if let val = specialProperties[propName] {
                //名称が特殊プロパティとして登録されている
                if(type != "unknown"){
                    let proxy:GLDSpecialPropertyProxy = specialProperties[propName]!
                    var prop:GLDTweenProperty = GLDTweenProperty()
                    prop.key = propName
                    prop.castHelper = self.castHelpers[type]!
                    prop.propertyProxy = specialProperties[propName]!
                    prop.valueStart = prop.propertyProxy.get(target)
                    prop.valueComplete = value2
                    tweenData.properties[propName] = prop
                }
            }else{
                if(type != "unknown"){
                    if(!GLDTweenUtil.hasProperty(target, key: propName)){
                        showWarning("AddTween '\(target)' does not have property named '\(propName)'")
                        continue;
                    }
                    //名称が分割プロパティとして登録されている場合は分割する（centerをxとyへなど）
                    //それ以外は普通にDoubleとして登録する
                    var prop:GLDTweenProperty = GLDTweenProperty()
                    prop.key = propName
                    prop.castHelper = self.castHelpers[type]!
                    prop.valueStart = prop.castHelper.getValue(target, key: propName)
                    prop.valueComplete = value2
                    tweenData.properties[propName] = prop
                }
            }
        }
        
        //Tweenに登録
        tweens.append(tweenData)
        
        //DurationもDelayも0ならば即実行
        if duration==0.0 && delay==0.0 {
            let index:Int = tweens.count - 1
            self.updateTweenByIndex(index)
            self.removeTweenByIndex(index)
        }
    }
    
    
    
    private func pauseAllTweens() -> Bool{
        var result:Bool = false
        for var i:Int=0; i<tweens.count; i++ {
            if(!tweens[i].killFlag){
                pauseTweenByIndex(i)
                result = true
            }
        }
        
        return result
    }
    
    
    
    private func removeTween(target:AnyObject) -> Bool{
        var result:Bool = false
        for(var i:Int=0; i<tweens.count; i++){
            var t:AnyObject = tweens[i].target
            if target === t && !tweens[i].killFlag{
                self.removeTweenByIndex(i)
                result = true
            }
        }
        return result
    }
    
    
    
    private func removeTween(target:AnyObject, props:Array<String>) -> Bool{
        var result:Bool = false
        for(var i:Int=0; i<self.tweens.count; i++){
            var t:AnyObject = self.tweens[i].target
            if target === t && !self.tweens[i].killFlag{
                //一致するtargetを発見
                for var j:Int = 0; j<props.count; j++ {
                    var propName:String = props[j]
                    if let exists = self.tweens[i].properties[propName] {
                        self.tweens[i].properties.removeValueForKey(propName)
                        result = true
                    }
                }
                //削除で該当TweenDataから全てのプロパティが無くなった場合は、TweenDataも削除
                if(self.tweens[i].properties.count==0){
                    self.removeTweenByIndex(i)
                }
            }
        }
        return result
    }
    
    
    
    private func removeAllTweens() -> Bool{
        var result:Bool = false
        for var i:Int=0; i<tweens.count; i++ {
            if(!tweens[i].killFlag){
                removeTweenByIndex(i)
                result = true
            }
        }
        
        return result
    }
    
    
    
    private func resumeTween(target:AnyObject) -> Bool{
        var result:Bool = false
        for(var i:Int=0; i<tweens.count; i++){
            var t:AnyObject = tweens[i].target
            if target === t && tweens[i].isPaused && !tweens[i].killFlag{
                self.resumeTweenByIndex(i)
                result = true
            }
        }
        return result
    }
    
    
    
    private func resumeAllTweens() -> Bool{
        var result:Bool = false
        for(var i:Int=0; i<self.tweens.count; i++){
            self.resumeTweenByIndex(i)
        }
        return result
    }
    
    
    
    func isTweening(#target:AnyObject) -> Bool{
        return false
    }
    
    

    /**
     シングルトンを取得する。
     :returns: GLDTweenインスタンスのシングルトンを返す。
    */
    private class var sharedEngine : GLDTween{
    struct Singleton{
        static let instance = GLDTween()
        }
        return Singleton.instance
    }
    
    
    /**
     イニシャライザ。GLDTweenは内部的にはシングルトンを、外部的にはクラス関数を使って操作する。ユーザーが実際に触ることはない。
    */
    private override init(){
        super.init()
        
        //諸々の値を初期化
        tweens = Array()
        easings = Dictionary()
        castHelpers = Dictionary()
        specialProperties = Dictionary()
        updateCurrentTime()
        
        //アニメーション関数を登録。 GLDEasingFunction プロトコルを実装すれば、独自関数を追加できる
        self.registerEasing(GLDEaseNoneFunction(), name:GLDEaseTypeNone)
        self.registerEasing(GLDEaseInQuadFunction(), name:GLDEaseTypeInQuad)
        self.registerEasing(GLDEaseOutQuadFunction(), name:GLDEaseTypeOutQuad)
        self.registerEasing(GLDEaseInOutQuadFunction(), name:GLDEaseTypeInOutQuad)
        self.registerEasing(GLDEaseInCubicFunction(), name:GLDEaseTypeInCubic)
        self.registerEasing(GLDEaseOutCubicFunction(), name:GLDEaseTypeOutCubic)
        self.registerEasing(GLDEaseInOutCubicFunction(), name:GLDEaseTypeInOutCubic)
        self.registerEasing(GLDEaseInCubicFunction(), name:GLDEaseTypeInQuart)
        self.registerEasing(GLDEaseOutCubicFunction(), name:GLDEaseTypeOutQuart)
        self.registerEasing(GLDEaseInOutCubicFunction(), name:GLDEaseTypeInOutQuart)
        self.registerEasing(GLDEaseInCubicFunction(), name:GLDEaseTypeInQuint)
        self.registerEasing(GLDEaseOutCubicFunction(), name:GLDEaseTypeOutQuint)
        self.registerEasing(GLDEaseInOutCubicFunction(), name:GLDEaseTypeInOutQuint)
        self.registerEasing(GLDEaseInSineFunction(), name:GLDEaseTypeInSine)
        self.registerEasing(GLDEaseOutSineFunction(), name:GLDEaseTypeOutSine)
        self.registerEasing(GLDEaseInOutSineFunction(), name:GLDEaseTypeInOutSine)
        self.registerEasing(GLDEaseInExpoFunction(), name:GLDEaseTypeInExpo)
        self.registerEasing(GLDEaseOutExpoFunction(), name:GLDEaseTypeOutExpo)
        self.registerEasing(GLDEaseInOutExpoFunction(), name:GLDEaseTypeInOutExpo)
        self.registerEasing(GLDEaseInCircFunction(), name:GLDEaseTypeInCirc)
        self.registerEasing(GLDEaseOutCircFunction(), name:GLDEaseTypeOutCirc)
        self.registerEasing(GLDEaseInOutCircFunction(), name:GLDEaseTypeInOutCirc)
        
        self.registerCastHelper(GLDTweenCastHelperDouble(), name: "Int")
        self.registerCastHelper(GLDTweenCastHelperDouble(), name: "CGFloat")
        self.registerCastHelper(GLDTweenCastHelperDouble(), name: "Double")
        self.registerCastHelper(GLDTweenCastHelperCGPoint(), name: "CGPoint")
        self.registerCastHelper(GLDTweenCastHelperCGSize(), name: "CGSize")
        self.registerCastHelper(GLDTweenCastHelperCGRect(), name: "CGRect")
        self.registerCastHelper(GLDTweenCastHelperCGAffineTransform(), name: "CGAffineTransform")
        self.registerCastHelper(GLDTweenCastHelperCATransform3D(), name: "CATransform3D")
        self.registerCastHelper(GLDTweenCastHelperUIColor(), name: "UIColor")
        
        //ショートカット変数をサポートするプロキシプラグインを登録
        self.registerSpecialProperty(GLDSpecialPropertyX(), name: "x")              // target.xを追加
        self.registerSpecialProperty(GLDSpecialPropertyY(), name: "y")              // target.yを追加
        self.registerSpecialProperty(GLDSpecialPropertyWidth(), name: "width")      //target.widthに対応
        self.registerSpecialProperty(GLDSpecialPropertyHeight(), name: "height")    //target.heightに対応
        self.registerSpecialProperty(GLDSpecialPropertyCenterX(), name: "centerX")  //target.centerXに対応
        self.registerSpecialProperty(GLDSpecialPropertyCenterY(), name: "centerY")  //target.centerYに対応
        self.registerSpecialProperty(GLDSpecialPropertySize(), name: "size")     //target.sizeに対応
        
        //タイマーを起動
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0/framerate, target: self, selector: Selector("update"), userInfo: nil, repeats: true)
        NSRunLoop.currentRunLoop().addTimer(timer, forMode: NSRunLoopCommonModes)
    }

    
    
    /**
     NSTimerによって定期的に呼び出されるアニメーション処理。
     NSTimerから呼ばれるのでプライベートにはしない
    */
    func update(){
        updateCurrentTime()
        updateTweens()
        teardownTweens()
    }
    
    
    
    /**
     アニメーションの基準となるタイムスタンプの更新。update()から呼ばれる。
    */
    private func updateCurrentTime(){
        self.currentTime = NSDate().timeIntervalSince1970
    }
    
    
    
    /**
     アニメーションの更新。update()から呼ばれる。
     :return: 処理中のアニメーション（削除中、待機中も含む）が1つ以上あればtrueを返す。
    */
    private func updateTweens() -> Bool{
        var result:Bool = false
        for var i:Int=0; i<self.tweens.count; i++ {
            var tween = self.tweens[i]
            if !tween.isPaused && !tween.killFlag{
                var isRunnning = updateTweenByIndex(i)
                if !isRunnning {
                    //終了したアニメにKillFlagを立てる
                    removeTweenByIndex(i)
                }
            }
        }
        
        return result
    }
    
    
    
    /**
     削除フラグのたったアニメーションを完全に削除する。
     update()から呼ばれる。
    */
    private func teardownTweens(){
        for var i:Int=0; i<self.tweens.count; i++ {
            if self.tweens[i].killFlag {
                removeTweenByIndex2(i)
                i--
            }
        }
    }
    
    
    
    /**
     アニメーションの表面的な削除。
     配列から直接削除せずに、まずはkillFlagを立てる。
     これはupdate中やcompleteクロージャ内でremove系を呼ばれた場合に、配列インデックスがずれて崩壊するのを防ぐため
    */
    private func removeTweenByIndex(index:Int) -> Bool{
        self.tweens[index].killFlag = true
        return true
    }
    
    
    
    /**
     アニメーションの削除
    */
    private func removeTweenByIndex2(index:Int) -> Bool{
        self.tweens.removeAtIndex(index)
        return true
    }
    
    
    
    /**
     アニメーションの一時停止
    */
    private func pauseTweenByIndex(index:Int) -> Bool{
        var tween = self.tweens[index]
        if tween.isPaused {
            return false
        }
        tween.timePaused = self.currentTime
        tween.isPaused = true
        return true
    }
    
    
    
    //Tweenのポーズを解除
    private func resumeTweenByIndex(index:Int) -> Bool{
        var tween = tweens[index]
        if !tween.isPaused {
            return false
        }
        //ポーズしていた時間だけStartやCompleteの時間をずらす
        tween.timeStart = tween.timeStart + self.currentTime - tween.timePaused
        tween.timeComplete = tween.timeComplete + self.currentTime - tween.timePaused
        tween.timePaused = 0.0
        tween.isPaused = false
        return true
    }
    
    
    
    //各ターゲットのTweenの更新
    //Tween継続中はtrueが、Tween終了時はfalseが返る
    private func updateTweenByIndex(index:Int) -> Bool{
        var tween:GLDTweenData = tweens[index]
        var target:NSObject = tween.target as NSObject
        var hasCompleted:Bool = false
        var propName:String
        var value:Any = 5.0
        
        
        //今回の更新でTweenが終了予定ならフラグを立てる
        if self.currentTime > tween.timeComplete {
            hasCompleted = true
        }
        

        if tween.timeStart <= self.currentTime{
            //まだ起動していなければ、Tweenを起動
            if(!tween.hasStarted){
                if let isExist = tween.start {
                    tween.start!()  //初回時ならonStartクロージャをコール（後でやる）
                }
                
                //Tweenの開始値を記録
                for key:String in tween.properties.keys {
                    var castHelper:GLDTweenCastHelper = tweens[index].properties[key]!.castHelper
                    if var val = specialProperties[key] {
                        value = tween.properties[key]!.propertyProxy.get(target)
                    }else{
                        value = castHelper.getValue(target, key: key)
                    }
                    tweens[index].properties[key]!.valueStart = value
                }
                tweens[index].hasStarted = true
            }
            
            //値の更新
           
            var newValue:Any = 5
            for key:String in tween.properties.keys {
                var castHelper:GLDTweenCastHelper = tween.properties[key]!.castHelper
                if hasCompleted == true{
                    //このTweenは今回で終了すので、completeValueで更新
                    newValue = tween.properties[key]!.valueComplete
                }else{
                    //このTweenは継続中なので、イージング関数で更新
                    let easeFunc:GLDEasingFunction = self.easings[tween.easing]!
                    let t:Double = Double(self.currentTime - tween.timeStart)
                    let d:Double = Double(tween.timeComplete - tween.timeStart)
                    newValue = castHelper.calcTween(t, d, tween.properties[key]!.valueStart, tween.properties[key]!.valueComplete, easeFunc)
                }
                //値を代入
                if var val = specialProperties[key] {
                    tween.properties[key]!.propertyProxy.set(target, value: newValue)
                }else{
                    //Responds Selectorでターゲットに値があるか確認して注入
                    
                    if GLDTweenUtil.hasProperty(target, key: key) {
                        castHelper.setValue(newValue, target: target, key: key)
                    }else{
                        println("WARNING! \(target): property '\(key)' not exist")
                    }
                }
            }
        }
        
        if hasCompleted == true{
            //Tweenの完了
            //Completionセレクター／クロージャの実行
            if let isExist = tween.completion {
                tween.completion!()
            }
            tween.hasCompleted = hasCompleted
            return false
        }
        
        return true
    }
    
    
    
    // MARK: - Plugin
    
    //イージング関数を登録
    private func registerEasing(transition: GLDEasingFunction, name:String){
        if let isExist = self.easings[name] {
            self.showWarning("Easing Function named '\(name)' is already exists. It will be replaced to \(transition).")
        }
        self.easings[name] = transition
    }
    
    
    
    //特殊プロパティの追加
    private func registerSpecialProperty(proxy:GLDSpecialPropertyProxy, name:String){
        if let isExist = self.specialProperties[name] {
            self.showWarning("Special Property '\(name)' is already exists. It will be replaced to \(proxy).")
        }
        self.specialProperties[name] = proxy
    }
    
    
    
    private func registerCastHelper(helper:GLDTweenCastHelper, name:String){
        self.castHelpers[name] = helper
    }
    
    
    
    // MARK: - Utils
    
    //どんな値もとりあえずDoubleに安定変換
    private func convertDouble(value:Any) -> Double{
        if value is Double {
            return value as Double
        }else if value is CGFloat {
            return Double(value as CGFloat)
        }else if value is Int {
            return Double(value as Int)
        }
        showWarning("ConvertToDouble Unknown Data Type:\(value)")
        return 0.0
    }
    
    
    
    //警告を出力
    private func showWarning(string:String){
        println("GLDTween WARNING: \(string)")
    }
}
