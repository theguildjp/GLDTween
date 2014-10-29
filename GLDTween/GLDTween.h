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
extern NSString *const GLDEasingNone;
extern NSString *const GLDEasingInQuad;
extern NSString *const GLDEasingOutQuad;
extern NSString *const GLDEasingInOutQuad;
extern NSString *const GLDEasingInCubic;
extern NSString *const GLDEasingOutCubic;
extern NSString *const GLDEasingInOutCubic;
extern NSString *const GLDEasingInQuart;
extern NSString *const GLDEasingOutQuart;
extern NSString *const GLDEasingInOutQuart;
extern NSString *const GLDEasingInQuint;
extern NSString *const GLDEasingOutQuint;
extern NSString *const GLDEasingInOutQuint;
extern NSString *const GLDEasingInSine;
extern NSString *const GLDEasingOutSine;
extern NSString *const GLDEasingInOutSine;
extern NSString *const GLDEasingInCirc;
extern NSString *const GLDEasingOutCirc;
extern NSString *const GLDEasingInOutCirc;
extern NSString *const GLDEasingInExpo;
extern NSString *const GLDEasingOutExpo;
extern NSString *const GLDEasingInOutExpo;
extern NSString *const GLDEasingInBack;
extern NSString *const GLDEasingOutBack;
extern NSString *const GLDEasingInOutBack;
extern NSString *const GLDEasingInBounce;
extern NSString *const GLDEasingOutBounce;
extern NSString *const GLDEasingInOutBounce;
extern NSString *const GLDEasingInElastic;
extern NSString *const GLDEasingOutElastic;
extern NSString *const GLDEasingInOutElastic;

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
