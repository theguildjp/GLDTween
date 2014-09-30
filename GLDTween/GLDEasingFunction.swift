//
//  GLDEasing.swift
//  GLDTween
//
//  Created by 深津 貴之 on 2014/09/26.
//  Copyright (c) 2014年 THE GUILD. All rights reserved.
//
//  Thanks for easing equations on
//  http://gizma.com/easing/

import UIKit

let GLDEaseTypeNone = "EaseNone"
let GLDEaseTypeInQuad = "EaseInQuad"
let GLDEaseTypeOutQuad = "EaseOutQuad"
let GLDEaseTypeInOutQuad = "EaseInOutQuad"
let GLDEaseTypeInCubic = "EaseInCubic"
let GLDEaseTypeOutCubic = "EaseOutCubic"
let GLDEaseTypeInOutCubic = "EaseInOutCubic"
let GLDEaseTypeInQuart = "EaseInQuart"
let GLDEaseTypeOutQuart = "EaseOutQuart"
let GLDEaseTypeInOutQuart = "EaseInOutQuart"
let GLDEaseTypeInQuint = "EaseInQuint"
let GLDEaseTypeOutQuint = "EaseOutQuint"
let GLDEaseTypeInOutQuint = "EaseInOutQuint"
let GLDEaseTypeInSine = "EaseInSine"
let GLDEaseTypeOutSine = "EaseOutSine"
let GLDEaseTypeInOutSine = "EaseInOutSine"
let GLDEaseTypeInExpo = "EaseInExpo"
let GLDEaseTypeOutExpo = "EaseOutExpo"
let GLDEaseTypeInOutExpo = "EaseInOutExpo"
let GLDEaseTypeInCirc = "EaseInCirc"
let GLDEaseTypeOutCirc = "EaseOutCirc"
let GLDEaseTypeInOutCirc = "EaseInOutCirc"
let GLDEaseTypeInBounce = "EaseInBounce"
let GLDEaseTypeOutBounce = "EaseOutBounce"
let GLDEaseTypeInOutBounce = "EaseInOutBounce"
let GLDEaseTypeInBack = "EaseInBack"
let GLDEaseTypeOutBack = "EaseOutBack"
let GLDEaseTypeInOutBack = "EaseInOutBack"


/*
アニメーション関数をオブジェクト化したクラス。
イージングカーブ毎にGLDTransitionを継承したクラス作成する。
このインスタンスを、GLDTweenのregisterTransitionで登録することで、イージングの種類を拡張できる。
*/

public protocol GLDEasingFunction{
    func calc(t:Double, b:Double, c:Double, d:Double) -> Double
}

class GLDEaseNoneFunction : NSObject, GLDEasingFunction{
    func calc(t:Double, b:Double, c:Double, d:Double) -> Double {
        return c*t/d + b
    }
}



class GLDEaseInQuadFunction : NSObject, GLDEasingFunction{
    func calc(t:Double, b:Double, c:Double, d:Double) -> Double {
        var t2:Double = t/d
        return b + c * t2 * t2
    }
}



class GLDEaseOutQuadFunction : NSObject, GLDEasingFunction{
    func calc(t:Double, b:Double, c:Double, d:Double) -> Double {
        var t2:Double = t/d
        return b + (-c * t2 * (t2-2))
    }
}



class GLDEaseInOutQuadFunction : NSObject, GLDEasingFunction{
    func calc(t:Double, b:Double, c:Double, d:Double) -> Double {
        var t2:Double = t/d*2
        if t2<1 {
            return c/2*t2*t2 + b
        }
        t2--
        return -c/2 * (t2*(t2-2) - 1) + b;
    }
}



class GLDEaseInCubicFunction : NSObject, GLDEasingFunction{
    func calc(t:Double, b:Double, c:Double, d:Double) -> Double {
        var t2:Double = t/d
        return b + c * t2 * t2 * t2
    }
}



class GLDEaseOutCubicFunction : NSObject, GLDEasingFunction{
    func calc(t:Double, b:Double, c:Double, d:Double) -> Double {
        var t2:Double = t/d
        t2--
        return b + c * (t2 * t2 * t2 + 1)
    }
}



class GLDEaseInOutCubicFunction : NSObject, GLDEasingFunction{
    func calc(t:Double, b:Double, c:Double, d:Double) -> Double {
        var t2:Double = t/d*2
        if(t2<1){
            return c/2*t2*t2*t2 + b
        }
        t2 -= 2;
        return b + c/2*(t2*t2*t2+2)
    }
}



class GLDEaseInQuartFunction : NSObject, GLDEasingFunction{
    func calc(t:Double, b:Double, c:Double, d:Double) -> Double {
        var t2:Double = t/d
        return b + c * t2 * t2 * t2 * t2
    }
}



class GLDEaseOutQuartFunction : NSObject, GLDEasingFunction{
    func calc(t:Double, b:Double, c:Double, d:Double) -> Double {
        var t2:Double = t/d
        t2--
        return b + c * (t2 * t2 * t2 * t2 + 1)
    }
}



class GLDEaseInOutQuartFunction : NSObject, GLDEasingFunction{
    func calc(t:Double, b:Double, c:Double, d:Double) -> Double {
        var t2:Double = t/d*2
        if(t2<1){
            return c/2*t2*t2*t2*t2 + b
        }
        t2 -= 2;
        return b + c/2*(t2*t2*t2*t2+2)
    }
}



class GLDEaseInQuintFunction : NSObject, GLDEasingFunction{
    func calc(t:Double, b:Double, c:Double, d:Double) -> Double {
        var t2:Double = t/d
        return b + c * t2 * t2 * t2 * t2 * t2
    }
}



class GLDEaseOutQuintFunction : NSObject, GLDEasingFunction{
    func calc(t:Double, b:Double, c:Double, d:Double) -> Double {
        var t2:Double = t/d
        t2--
        return b + c * (t2 * t2 * t2 * t2 * t2 + 1)
    }
}



class GLDEaseInOutQuintFunction : NSObject, GLDEasingFunction{
    func calc(t:Double, b:Double, c:Double, d:Double) -> Double {
        var t2:Double = t/d*2
        if(t2<1){
            return c/2*t2*t2*t2*t2*t2 + b
        }
        t2 -= 2;
        return b + c/2*(t2*t2*t2*t2*t2+2)
    }
}


class GLDEaseInSineFunction : NSObject, GLDEasingFunction{
    func calc(t:Double, b:Double, c:Double, d:Double) -> Double {
        return -c * cos(t/d * (M_PI_2)) + c + b
    }
}



class GLDEaseOutSineFunction : NSObject, GLDEasingFunction{
    func calc(t:Double, b:Double, c:Double, d:Double) -> Double {
        return c * sin(t/d * (M_PI_2)) + b
    }
}



class GLDEaseInOutSineFunction : NSObject, GLDEasingFunction{
    func calc(t:Double, b:Double, c:Double, d:Double) -> Double {
        return -c/2 * (cos(M_PI*t/d) - 1) + b;
    }
}



class GLDEaseInExpoFunction : NSObject, GLDEasingFunction{
    func calc(t:Double, b:Double, c:Double, d:Double) -> Double {
        return c * pow( 2, 10 * (t/d - 1) ) + b
    }
}



class GLDEaseOutExpoFunction : NSObject, GLDEasingFunction{
    func calc(t:Double, b:Double, c:Double, d:Double) -> Double {
        return c * ( -pow( 2, -10 * t/d ) + 1 ) + b
    }
}



class GLDEaseInOutExpoFunction : NSObject, GLDEasingFunction{
    func calc(t:Double, b:Double, c:Double, d:Double) -> Double {
        var t2:Double = t/d*2
        if (t2 < 1){
            return c/2 * pow( 2, 10 * (t2 - 1) ) + b
        }
        t2--;
        return c/2 * ( -pow( 2, -10 * t2) + 2 ) + b
    }
}



class GLDEaseInCircFunction : NSObject, GLDEasingFunction{
    func calc(t:Double, b:Double, c:Double, d:Double) -> Double {
        var t2:Double = t/d
        return -c * (sqrt(1 - t2*t2) - 1) + b
    }
}



class GLDEaseOutCircFunction : NSObject, GLDEasingFunction{
    func calc(t:Double, b:Double, c:Double, d:Double) -> Double {
        var t2:Double = t/d
        t2--
        return c * sqrt(1 - t2*t2) + b
    }
}



class GLDEaseInOutCircFunction : NSObject, GLDEasingFunction{
    func calc(t:Double, b:Double, c:Double, d:Double) -> Double {
        var t2:Double = t/d*2
        if (t2 < 1){
            return -c/2 * (sqrt(1 - t2*t2) - 1) + b
        }
        t2 -= 2
        return c/2 * (sqrt(1 - t2*t2) + 1) + b;
    }
}
