//
//  GLDTweenProperty.h
//  GLDTween
//
//  Created by Takayuki Fukatsu on 2014/10/01.
//  Copyright (c) 2014 THE GUILD. All rights reserved.
//

#import "GLDEasingPlugin.h"
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>


@interface GLDTweenProperty : NSObject

@property (strong) NSString *key;
@property (strong, readonly) NSString *type;
@property NSValue *startValue;
@property NSValue *completeValue;
@property BOOL rounded;

- (void)setStartValueForTarget:(NSObject *)target key:(NSString *)key;
- (void)setTweenValueForTarget:(NSObject *)target key:(NSString *)key time:(float)t duration:(float)d ease:(GLDEasing *)ease;
- (void)setCompleteValueForTarget:(NSObject *)target key:(NSString *)key;
- (void)updateStartValueForTarget:(NSObject *)target key:(NSString *)key;
- (void)setValue:(NSValue *)value forTarget:(NSObject *)target key:(NSString *)key;
- (id)valueForTarget:(NSObject *)target key:(NSString *)key;

@end


@interface GLDTweenPropertyCGFloat : GLDTweenProperty
@end


@interface GLDTweenPropertyCGPoint : GLDTweenProperty
@end


@interface GLDTweenPropertyCGSize : GLDTweenProperty
@end


@interface GLDTweenPropertyCGRect : GLDTweenProperty
@end


@interface GLDTweenPropertyCGAffineTransform : GLDTweenProperty
@end


@interface GLDTweenPropertyCATransform3D : GLDTweenProperty
@end
