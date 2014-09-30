//
//  TweenCastHelper.swift
//  GLDTween
//
//  Created by 深津 貴之 on 2014/09/29.
//  Copyright (c) 2014年 THE GUILD. All rights reserved.
//

import UIKit

/**
iOSにおける様々な型を同一視して、プロパティの操作、トゥイーン計算を行う為のヘルパークラス。
*/
protocol GLDTweenCastHelper{
    var type:String { get }
    func calcTween(t:Double, _ d:Double, _ v0:Any, _ v1:Any, _ easing:GLDEasingFunction) -> Any
    func getValue(target:AnyObject, key:String) -> Any
    func setValue(value:Any, target:AnyObject, key:String)
}



class GLDTweenCastHelperInt: NSObject, GLDTweenCastHelper {
    var type:String {
        get {
            return "Int"
        }
    }
    
    func calcTween(t:Double, _ d:Double, _ v0:Any, _ v1:Any, _ easing:GLDEasingFunction) -> Any{
        let b:Double = v0 as Double
        let c:Double = (v1 as Double) - (v0 as Double)
        return CGFloat(easing.calc(t, b: b, c: c, d: d))
    }
    
    func getValue(target: AnyObject, key: String) -> Any {
        return Double(target.valueForKey(key) as CGFloat)
    }
    
    func setValue(value: Any, target: AnyObject, key: String) {
        target.setValue(value as CGFloat, forKey: key)
    }
}


class GLDTweenCastHelperCGFloat: NSObject, GLDTweenCastHelper {
    var type:String {
        get {
            return "CGFloat"
        }
    }
    
    func calcTween(t:Double, _ d:Double, _ v0:Any, _ v1:Any, _ easing:GLDEasingFunction) -> Any{
        let b:Double = v0 as Double
        let c:Double = (v1 as Double) - (v0 as Double)
        return CGFloat(easing.calc(t, b: b, c: c, d: d))
    }
    
    func getValue(target: AnyObject, key: String) -> Any {
        return Double(target.valueForKey(key) as CGFloat)
    }
    
    func setValue(value: Any, target: AnyObject, key: String) {
        target.setValue(value as CGFloat, forKey: key)
    }
}


class GLDTweenCastHelperDouble: NSObject, GLDTweenCastHelper {
    var type:String {
        get {
            return "Double"
        }
    }
    
    func calcTween(t:Double, _ d:Double, _ v0:Any, _ v1:Any, _ easing:GLDEasingFunction) -> Any{
        var b:Double = v0 as Double
        var c:Double = (v1 as Double) - (v0 as Double)
        return easing.calc(t, b: b, c: c, d: d)
    }
    
    func getValue(target: AnyObject, key: String) -> Any {
        return Double(target.valueForKey(key) as CGFloat)
    }
    
    func setValue(value: Any, target: AnyObject, key: String) {
        target.setValue(value as Double, forKey: key)
    }
}


class GLDTweenCastHelperCGPoint: NSObject, GLDTweenCastHelper {
    var type:String {
        get {
            return "CGPoint"
        }
    }
    
    func calcTween(t:Double, _ d:Double, _ v0:Any, _ v1:Any, _ easing:GLDEasingFunction) -> Any{
        let _v0:CGPoint = v0 as CGPoint
        let _v1:CGPoint = v1 as CGPoint
        let destX:Double = easing.calc(t, b: Double(_v0.x), c: Double(_v1.x - _v0.x), d: d)
        let destY:Double = easing.calc(t, b: Double(_v0.y), c: Double(_v1.y - _v0.y), d: d)
        return CGPoint(x:destX, y:destY)

    }
    
    func getValue(target: AnyObject, key: String) -> Any {
        var obj:AnyObject = target.valueForKey(key)
        var nsv:NSValue = obj as NSValue
        return nsv.CGPointValue()
    }
    
    func setValue(value: Any, target: AnyObject, key: String) {
        var nsv:NSValue = NSValue(CGPoint: value as CGPoint)
        target.setValue(nsv, forKey: key)
    }
}


class GLDTweenCastHelperCGSize: NSObject, GLDTweenCastHelper {
    var type:String {
        get {
            return "CGSize"
        }
    }
    
    func calcTween(t:Double, _ d:Double, _ v0:Any, _ v1:Any, _ easing:GLDEasingFunction) -> Any{
        let _v0:CGSize = v0 as CGSize
        let _v1:CGSize = v1 as CGSize
        let bw:Double = Double(_v0.width)
        let bh:Double = Double(_v0.height)
        let cw:Double = Double(_v1.width - _v0.height)
        let ch:Double = Double(_v1.width - _v0.height)
        let destW:Double = easing.calc(t, b: bw, c: cw, d: d)
        let destH:Double = easing.calc(t, b: bh, c: ch, d: d)
        return CGSize(width:destW, height:destH)
    }
    
    func getValue(target: AnyObject, key: String) -> Any {
        var obj:AnyObject = target.valueForKey(key)
        var nsv:NSValue = obj as NSValue
        return nsv.CGSizeValue()
    }
    
    func setValue(value: Any, target: AnyObject, key: String) {
        var nsv:NSValue = NSValue(CGSize: value as CGSize)
        target.setValue(nsv, forKey: key)
    }
}


class GLDTweenCastHelperCGRect: NSObject, GLDTweenCastHelper {
    var type:String {
        get {
            return "CGRect"
        }
    }
    
    func calcTween(t:Double, _ d:Double, _ v0:Any, _ v1:Any, _ easing:GLDEasingFunction) -> Any{
        let _v0:CGRect = v0 as CGRect
        let _v1:CGRect = v1 as CGRect
        let bx:Double = Double(_v0.origin.x)
        let by:Double = Double(_v0.origin.y)
        let cx:Double = Double(_v1.origin.x - _v0.origin.x)
        let cy:Double = Double(_v1.origin.y - _v0.origin.y)
        let bw:Double = Double(_v0.size.width)
        let bh:Double = Double(_v0.size.height)
        let cw:Double = Double(_v1.size.width - _v0.size.width)
        let ch:Double = Double(_v1.size.height - _v0.size.height)
        let destX:Double = easing.calc(t, b: bx, c: cx, d: d)
        let destY:Double = easing.calc(t, b: by, c: cy, d: d)
        let destW:Double = easing.calc(t, b: bw, c: cw, d: d)
        let destH:Double = easing.calc(t, b: bh, c: ch, d: d)
        return CGRect(x:destX, y:destY, width:destW, height:destH)
    }
    
    func getValue(target: AnyObject, key: String) -> Any {
        var obj:AnyObject = target.valueForKey(key)
        var nsv:NSValue = obj as NSValue
        return nsv.CGRectValue()
    }
    
    func setValue(value: Any, target: AnyObject, key: String) {
        var nsv:NSValue = NSValue(CGRect: value as CGRect)
        target.setValue(nsv, forKey: key)
    }
}


class GLDTweenCastHelperCGAffineTransform: NSObject, GLDTweenCastHelper {
    var type:String {
        get {
            return "CGAffineTransform"
        }
    }
    
    func calcTween(t:Double, _ d:Double, _ v0:Any, _ v1:Any, _ easing:GLDEasingFunction) -> Any{
        var _v0:CGAffineTransform = v0 as CGAffineTransform
        var _v1:CGAffineTransform = v1 as CGAffineTransform
        var ba:Double = Double(_v0.a)
        var bb:Double = Double(_v0.b)
        var bc:Double = Double(_v0.c)
        var bd:Double = Double(_v0.d)
        var btx:Double = Double(_v0.tx)
        var bty:Double = Double(_v0.ty)
        var ca:Double = Double(_v1.a - _v0.a)
        var cb:Double = Double(_v1.b - _v0.b)
        var cc:Double = Double(_v1.c - _v0.c)
        var cd:Double = Double(_v1.d - _v0.d)
        var ctx:Double = Double(_v1.tx - _v0.tx)
        var cty:Double = Double(_v1.ty - _v0.ty)
        var da:Double = easing.calc(t, b: ba, c: ca, d: d)
        var db:Double = easing.calc(t, b: bb, c: cb, d: d)
        var dc:Double = easing.calc(t, b: bc, c: cc, d: d)
        var dd:Double = easing.calc(t, b: bd, c: cd, d: d)
        var dtx:Double = easing.calc(t, b: btx, c: ctx, d: d)
        var dty:Double = easing.calc(t, b: bty, c: cty, d: d)
        return CGAffineTransform(a: CGFloat(da), b: CGFloat(db), c: CGFloat(dc), d: CGFloat(dd), tx: CGFloat(dtx), ty: CGFloat(dty))
    }
    
    func getValue(target: AnyObject, key: String) -> Any {
        var obj:AnyObject = target.valueForKey(key)
        var nsv:NSValue = obj as NSValue
        return nsv.CGAffineTransformValue()
    }
    
    func setValue(value: Any, target: AnyObject, key: String) {
        var nsv:NSValue = NSValue(CGAffineTransform: value as CGAffineTransform)
        target.setValue(nsv, forKey: key)
    }
}


class GLDTweenCastHelperCATransform3D: NSObject, GLDTweenCastHelper {
    var type:String {
        get {
            return "CATransform3D"
        }
    }
    
    func calcTween(t:Double, _ d:Double, _ v0:Any, _ v1:Any, _ easing:GLDEasingFunction) -> Any{
        var _v0:CATransform3D = v0 as CATransform3D
        var _v1:CATransform3D = v1 as CATransform3D
        var dt:CATransform3D = CATransform3DIdentity
        dt.m11 = CGFloat(easing.calc(t, b: Double(_v0.m11), c: Double(_v1.m11-_v0.m11), d: d))
        dt.m12 = CGFloat(easing.calc(t, b: Double(_v0.m12), c: Double(_v1.m12-_v0.m12), d: d))
        dt.m13 = CGFloat(easing.calc(t, b: Double(_v0.m13), c: Double(_v1.m13-_v0.m13), d: d))
        dt.m14 = CGFloat(easing.calc(t, b: Double(_v0.m14), c: Double(_v1.m14-_v0.m14), d: d))
        dt.m21 = CGFloat(easing.calc(t, b: Double(_v0.m21), c: Double(_v1.m21-_v0.m21), d: d))
        dt.m22 = CGFloat(easing.calc(t, b: Double(_v0.m22), c: Double(_v1.m22-_v0.m22), d: d))
        dt.m23 = CGFloat(easing.calc(t, b: Double(_v0.m23), c: Double(_v1.m23-_v0.m23), d: d))
        dt.m24 = CGFloat(easing.calc(t, b: Double(_v0.m24), c: Double(_v1.m24-_v0.m24), d: d))
        dt.m31 = CGFloat(easing.calc(t, b: Double(_v0.m31), c: Double(_v1.m31-_v0.m31), d: d))
        dt.m32 = CGFloat(easing.calc(t, b: Double(_v0.m32), c: Double(_v1.m32-_v0.m32), d: d))
        dt.m33 = CGFloat(easing.calc(t, b: Double(_v0.m33), c: Double(_v1.m33-_v0.m33), d: d))
        dt.m34 = CGFloat(easing.calc(t, b: Double(_v0.m34), c: Double(_v1.m34-_v0.m34), d: d))
        dt.m41 = CGFloat(easing.calc(t, b: Double(_v0.m41), c: Double(_v1.m41-_v0.m41), d: d))
        dt.m42 = CGFloat(easing.calc(t, b: Double(_v0.m42), c: Double(_v1.m42-_v0.m42), d: d))
        dt.m43 = CGFloat(easing.calc(t, b: Double(_v0.m43), c: Double(_v1.m43-_v0.m43), d: d))
        dt.m44 = CGFloat(easing.calc(t, b: Double(_v0.m44), c: Double(_v1.m44-_v0.m44), d: d))
        return dt
    }
    
    func getValue(target: AnyObject, key: String) -> Any {
        var obj:AnyObject = target.valueForKey(key)
        var nsv:NSValue = obj as NSValue
        return nsv.CATransform3DValue
    }
    
    func setValue(value: Any, target: AnyObject, key: String) {
        var nsv:NSValue = NSValue(CATransform3D: value as CATransform3D)
        target.setValue(nsv, forKey: key)
    }
}


class GLDTweenCastHelperUIColor: NSObject, GLDTweenCastHelper {
    var type:String {
        get {
            return "UIColor"
        }
    }
    
    func calcTween(t:Double, _ d:Double, _ v0:Any, _ v1:Any, _ easing:GLDEasingFunction) -> Any{
        var h0:CGFloat = 0.0
        var s0:CGFloat = 0.0
        var b0:CGFloat = 0.0
        var a0:CGFloat = 0.0
        var h1:CGFloat = 0.0
        var s1:CGFloat = 0.0
        var b1:CGFloat = 0.0
        var a1:CGFloat = 0.0
        (v0 as UIColor).getHue(&h0, saturation: &s0, brightness: &b0, alpha: &a0)
        (v1 as UIColor).getHue(&h1, saturation: &s1, brightness: &b1, alpha: &a1)
        var dh:Double = easing.calc(t, b: Double(h0), c: Double(h1-h0), d: d)
        var ds:Double = easing.calc(t, b: Double(s0), c: Double(s1-s0), d: d)
        var db:Double = easing.calc(t, b: Double(b0), c: Double(b1-b0), d: d)
        var da:Double = easing.calc(t, b: Double(a0), c: Double(a1-a0), d: d)
        return UIColor(hue: CGFloat(dh), saturation: CGFloat(ds), brightness: CGFloat(db), alpha: CGFloat(da))
    }
    
    func getValue(target: AnyObject, key: String) -> Any {
        var obj:AnyObject = target.valueForKey(key)
        return obj as UIColor
    }
    
    func setValue(value: Any, target: AnyObject, key: String) {
        target.setValue(value as UIColor, forKey: key)
    }
}

