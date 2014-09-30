//
//  GLDSpecialProperty.swift
//  GLDTween
//
//  Created by 深津 貴之 on 2014/09/27.
//  Copyright (c) 2014年 THE GUILD. All rights reserved.
//

import UIKit

protocol GLDSpecialPropertyProxy{
    var key:String{get}
    var type:String{get}
    func get(target:AnyObject) -> Any
    func set(target:AnyObject, value:Any)
}



class GLDSpecialPropertyX: NSObject, GLDSpecialPropertyProxy{
    var key:String{
        get{
            return "x"
        }
    }
    
    var type:String{
        get{
            return "Double"
        }
    }
    
    func get(target:AnyObject) -> Any{
        if(target is UIView){
            return Double(target.frame.origin.x as CGFloat)
        }
        return Double(target.valueForKey(self.key) as CGFloat)
    }
    
    func set(target:AnyObject, value:Any){
        if(target is UIView){
            (target as UIView).frame.origin.x = CGFloat(value as Double)
        }else{
            target.setValue(CGFloat(value as Double), forKey: self.key)
        }
    }
}



class GLDSpecialPropertyY: NSObject, GLDSpecialPropertyProxy{
    var key:String{
        get{
            return "y"
        }
    }
    
    var type:String{
        get{
            return "Double"
        }
    }
    
    func get(target:AnyObject) -> Any{
        if(target is UIView){
            return Double(target.frame.origin.y as CGFloat)
        }
        return Double(target.valueForKey(self.key) as CGFloat)
    }
    
    func set(target:AnyObject, value:Any){
        if(target is UIView){
            (target as UIView).frame.origin.y = CGFloat(value as Double)
        }else{
            target.setValue(CGFloat(value as Double), forKey: self.key)
        }
    }
}



class GLDSpecialPropertyWidth: NSObject, GLDSpecialPropertyProxy{
    var key:String{
        get{
            return "width"
        }
    }
    
    var type:String{
        get{
            return "Double"
        }
    }
    
    func get(target:AnyObject) -> Any{
        if(target is UIView){
            return Double(target.frame.size.width as CGFloat)
        }
        return Double(target.valueForKey(self.key) as CGFloat)
    }
    
    func set(target:AnyObject, value:Any){
        if(target is UIView){
            (target as UIView).frame.size.width = CGFloat(value as Double)
        }else{
            target.setValue(CGFloat(value as Double), forKey: self.key)
        }
    }
}



class GLDSpecialPropertyHeight: NSObject, GLDSpecialPropertyProxy{
    var key:String{
        get{
            return "height"
        }
    }
    
    var type:String{
        get{
            return "Double"
        }
    }
    
    func get(target:AnyObject) -> Any{
        if(target is UIView){
            return Double(target.frame.size.height as CGFloat)
        }
        return Double(target.valueForKey(self.key) as CGFloat)
    }
    
    func set(target:AnyObject, value:Any){
        if(target is UIView){
            (target as UIView).frame.size.height = CGFloat(value as Double)
        }else{
            target.setValue(CGFloat(value as Double), forKey: self.key)
        }
    }
}



class GLDSpecialPropertyCenterX: NSObject, GLDSpecialPropertyProxy{
    var key:String{
        get{
            return "centerX"
        }
    }
    
    var type:String{
        get{
            return "Double"
        }
    }
    
    func get(target:AnyObject) -> Any{
        if(target is UIView){
            return Double(target.center.x as CGFloat)
        }
        return 0
    }
    
    func set(target:AnyObject, value:Any){
        if(target is UIView){
            (target as UIView).center.x = CGFloat(value as Double)
        }else{
        }
    }
}



class GLDSpecialPropertyCenterY: NSObject, GLDSpecialPropertyProxy{
    var key:String{
        get{
            return "centerY"
        }
    }
    
    var type:String{
        get{
            return "Double"
        }
    }
    
    func get(target:AnyObject) -> Any{
        if(target is UIView){
            return Double(target.center.y as CGFloat)
        }
        return 0
    }
    
    func set(target:AnyObject, value:Any){
        if(target is UIView){
            (target as UIView).center.y = CGFloat(value as Double)
        }else{
            
        }
    }
}



class GLDSpecialPropertySize: NSObject, GLDSpecialPropertyProxy{
    var key:String{
        get{
            return "size"
        }
    }
    
    var type:String{
        get{
            return "CGSize"
        }
    }
    
    func get(target:AnyObject) -> Any{
        if(target is UIView){
            return (target as UIView).frame.size
        }else if (target is CALayer){
            return (target as CALayer).frame.size
        }
        return 0
    }
    
    func set(target:AnyObject, value:Any){
        if(target is UIView){
            println("CGSize Setter \(value)")
            (target as UIView).frame.size = value as CGSize
        }else if target is CALayer{
            (target as CALayer).frame.size = value as CGSize
        }
    }
}



class GLDSpecialPropertyOrigin: NSObject, GLDSpecialPropertyProxy{
    var key:String{
        get{
            return "origin"
        }
    }
    
    var type:String{
        get{
            return "CGPoint"
        }
    }
    
    func get(target:AnyObject) -> Any{
        if(target is UIView){
            return (target as UIView).frame.origin
        }else if (target is CALayer){
            return (target as CALayer).frame.origin
        }
        return 0
    }
    
    func set(target:AnyObject, value:Any){
        if(target is UIView){
            (target as UIView).frame.origin = value as CGPoint
        }else if target is CALayer{
            (target as CALayer).frame.origin = value as CGPoint
        }
    }
}

