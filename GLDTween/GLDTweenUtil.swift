//
//  GLDTweenUtil.swift
//  GLDTween
//
//  Created by 深津 貴之 on 2014/09/29.
//  Copyright (c) 2014年 THE GUILD. All rights reserved.
//

import UIKit

class GLDTweenUtil: NSObject {
    class func typeOfValue(value:Any) -> String{
        if value is CGFloat {
            return "CGFloat"
        }else if value is Int {
            return "Int"
        }else if value is Double {
            return "Double"
        }else if value is CGPoint {
            return "CGPoint"
        }else if value is CGSize {
            return "CGSize"
        }else if value is CGRect {
            return "CGRect"
        }else if value is CGAffineTransform {
            return "CGAffineTransform"
        }else if value is CATransform3D {
            return "CATransform3D"
        }else if value is NSObject {
            return (value as NSObject).classForCoder.description()
        }
        return "unknown"
    }
    
    
    /**
    Valueは数字かどうか？
    */
    class func isKindOfNumber(value:Any) -> Bool{
        if value is CGFloat{
            return true
        }else if value is UInt{
            return true
        }else if value is Int {
            return true
        }else if value is Double {
            return true
        }else if value is NSNumber {
            return true
        }
        return false
    }
    
    
    
    /**
    NSObjectが任意のプロパティまたは変数を持っているか？
    */
    class func hasProperty(target:NSObject, key:String) -> Bool{
        if target.respondsToSelector(Selector(key)) {
            return true
        }
        return false
    }
}
