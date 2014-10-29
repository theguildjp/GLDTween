//
//  GLDTweenPropertyPlugin.h
//  GLDTween
//
//  Created by Takayuki Fukatsu on 2014/10/01.
//  Copyright (c) 2014 THE GUILD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "GLDTweenProperty.h"


@interface GLDTweenPropertyX : GLDTweenPropertyCGFloat
@end


@interface GLDTweenPropertyY : GLDTweenPropertyCGFloat
@end


@interface GLDTweenPropertyWidth : GLDTweenPropertyCGFloat
@end


@interface GLDTweenPropertyHeight : GLDTweenPropertyCGFloat
@end


@interface GLDTweenPropertyCenterX : GLDTweenPropertyCGFloat
@end


@interface GLDTweenPropertyCenterY : GLDTweenPropertyCGFloat
@end


@interface GLDTweenPropertyTransform3D : GLDTweenPropertyCATransform3D
@end
