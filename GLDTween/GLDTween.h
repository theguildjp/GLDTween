//
//  GLDTween.h
//  GLDTween
//
//  Created by Takayuki Fukatsu on 2014/10/01.
//  Copyright (c) 2014 THE GUILD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>

#import "GLDTweenTween.h"
#import "GLDTweenBlock.h"
#import "GLDTweenSelector.h"


//Easing Constants
extern NSString *const GLDEasingTypeEaseNone;
extern NSString *const GLDEasingTypeEaseInQuad;
extern NSString *const GLDEasingTypeEaseOutQuad;
extern NSString *const GLDEasingTypeEaseInOutQuad;
extern NSString *const GLDEasingTypeEaseInCubic;
extern NSString *const GLDEasingTypeEaseOutCubic;
extern NSString *const GLDEasingTypeEaseInOutCubic;
extern NSString *const GLDEasingTypeEaseInQuart;
extern NSString *const GLDEasingTypeEaseOutQuart;
extern NSString *const GLDEasingTypeEaseInOutQuart;
extern NSString *const GLDEasingTypeEaseInQuint;
extern NSString *const GLDEasingTypeEaseOutQuint;
extern NSString *const GLDEasingTypeEaseInOutQuint;
extern NSString *const GLDEasingTypeEaseInSine;
extern NSString *const GLDEasingTypeEaseOutSine;
extern NSString *const GLDEasingTypeEaseInOutSine;
extern NSString *const GLDEasingTypeEaseInCirc;
extern NSString *const GLDEasingTypeEaseOutCirc;
extern NSString *const GLDEasingTypeEaseInOutCirc;
extern NSString *const GLDEasingTypeEaseInExpo;
extern NSString *const GLDEasingTypeEaseOutExpo;
extern NSString *const GLDEasingTypeEaseInOutExpo;
extern NSString *const GLDEasingTypeEaseInBack;
extern NSString *const GLDEasingTypeEaseOutBack;
extern NSString *const GLDEasingTypeEaseInOutBack;
extern NSString *const GLDEasingTypeEaseInBounce;
extern NSString *const GLDEasingTypeEaseOutBounce;
extern NSString *const GLDEasingTypeEaseInOutBounce;
extern NSString *const GLDEasingTypeEaseInElastic;
extern NSString *const GLDEasingTypeEaseOutElastic;
extern NSString *const GLDEasingTypeEaseInOutElastic;

extern NSString *const GLDTweenParamDuration;
extern NSString *const GLDTweenParamDelay;
extern NSString *const GLDTweenParamRepeat;
extern NSString *const GLDTweenParamEasing;
extern NSString *const GLDTweenParamRounded;
extern NSString *const GLDTweenParamStartSelector;
extern NSString *const GLDTweenParamUpdateSelector;
extern NSString *const GLDTweenParamRepeatSelector;
extern NSString *const GLDTweenParamCompletionSelector;
extern NSString *const GLDTweenParamStartBlock;
extern NSString *const GLDTweenParamUpdateBlock;
extern NSString *const GLDTweenParamRepeatBlock;
extern NSString *const GLDTweenParamCompletionBlock;
extern NSString *const GLDTweenParamRepeatsDelay;
extern NSString *const GLDTweenParamLocksInteraction;
extern NSString *const GLDTweenParamUnlocksInteraction;


@interface GLDTween : NSObject

//Addition
+ (BOOL)addTween:(NSObject *)target withParams:(NSDictionary *)params;

//Remove
+ (BOOL)removeTween:(NSObject *)target;
+ (BOOL)removeTweens:(NSArray *)targets;
+ (BOOL)removeTween:(NSObject *)target withProps:(NSArray *)props;
+ (BOOL)removeAllTweens;

//Pause
+ (BOOL)pauseTween:(NSObject *)target;
+ (BOOL)pauseTweens:(NSArray *)targets;
+ (BOOL)pauseAllTweens;

//Resume
+ (BOOL)resumeTween:(NSObject *)target;
+ (BOOL)resumeTweens:(NSArray *)targets;
+ (BOOL)resumeAllTweens;

//Plugin Management
+ (BOOL)registerEasingPlugin:(Class)class forKey:(NSString *)key;
+ (BOOL)registerSpecialPropertyPlugin:(Class)class forKey:(NSString *)key;

//Utils
+ (NSArray *)easingNames;

//Not implemented
+ (BOOL)isTweening:(NSObject *)target;

@end
