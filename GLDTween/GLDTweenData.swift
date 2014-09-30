//
//  GLDTweenData.swift
//  GLDTween
//
//  Created by 深津 貴之 on 2014/09/26.
//  Copyright (c) 2014年 THE GUILD. All rights reserved.
//

import UIKit


/**
GLDTweenで引数としてクロージャを渡すためのラッパー構造体
*/
struct GLDTweenClosure{
    typealias GLDTweenClosureContainer = () -> Void
    let closure:GLDTweenClosureContainer
    
    init(closure:() -> Void){
        self.closure = closure
    }
    
    func execute(){
        self.closure()
    }
}



// 個々のTweenの情報を格納したオブジェクト
class GLDTweenData: NSObject {
    //アニメーションの対象
    var target:NSObject!
    
    //変更するプロパティの情報
    var properties:Dictionary<String, GLDTweenProperty>!   //動かすべきプロパティ
    
    //時間の記録
    var timeStart:Double!         //開始予定タイムスタンプ
    var timeComplete:Double!      //完了予定タイムスタンプ
    var timePaused:Double!        //ポーズ開始時のタイムスタンプ
    
    var easing:String!        //イージングタイプ名
    
    var start:(()->Void)?
    var completion:(()->Void)?  //完了時に実行するクロージャ
    
    var rounded:Bool = false    //値の小数点を四捨五入するか
    
    //状態フラグ
    var isPaused:Bool = false       //ポーズ中かどうか？
    var hasStarted:Bool = false     //すでにDelayが終わり走り始めているかの管理フラグ
    var hasCompleted:Bool = false   //すでに完了しているかの管理フラグ
    var killFlag:Bool = false        //削除用フラグ
    
    override init(){
        super.init()
        self.properties = Dictionary()
    }
}
