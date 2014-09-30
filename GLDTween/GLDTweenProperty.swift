//
//  GLDTweenProperty.swift
//  GLDTween
//
//  Created by 深津 貴之 on 2014/09/26.
//  Copyright (c) 2014年 THE GUILD. All rights reserved.
//

import UIKit

class GLDTweenProperty: NSObject {
    var key:String = ""
    var castHelper:GLDTweenCastHelper!
    var propertyProxy:GLDSpecialPropertyProxy!
    var valueStart:Any!
    var valueComplete:Any!
    var usePropertyProxy:Bool = false
}