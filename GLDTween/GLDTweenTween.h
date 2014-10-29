//
//  GLDTweenTween.h
//  GLDTween
//
//  Created by Takayuki Fukatsu on 2014/10/01.
//  Copyright (c) 2014年 THE GUILD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GLDTweenSelector.h"
#import "GLDTweenBlock.h"


/**
 Animation Instance that runs on GLDTween Animation Engine
 */
@interface GLDTweenTween : NSObject

@property (nonatomic, strong) NSObject* target;
@property (nonatomic, strong) NSMutableDictionary* properties;
@property (nonatomic, strong) NSString* easing;
@property (nonatomic) int repeat;
@property (nonatomic) BOOL repeatDelay;
@property (nonatomic) BOOL rounded;

//Interaction(Testing)
@property (nonatomic) BOOL lockInteraction; //Ignore Interaction when add.
@property (nonatomic) BOOL unlockInteraction; //End Ignore Interaction when complete(or removed?)

//Time
@property (nonatomic) NSTimeInterval startTime;
@property (nonatomic) NSTimeInterval completeTime;
@property (nonatomic) NSTimeInterval pausedTime;
@property (nonatomic) NSTimeInterval delay;

//Flag
@property (nonatomic) BOOL isPaused;
@property (nonatomic) BOOL hasStarted;
@property (nonatomic) BOOL hasCompleted;
@property (nonatomic) BOOL killFlag;

//Blocks
@property (nonatomic, strong) GLDTweenBlock* startBlock;
@property (nonatomic, strong) GLDTweenBlock* updateBlock;
@property (nonatomic, strong) GLDTweenBlock* repeatBlock;
@property (nonatomic, strong) GLDTweenBlock* completionBlock;


//Selectors
@property (nonatomic, strong) GLDTweenSelector* startSelector;
@property (nonatomic, strong) GLDTweenSelector* updateSelector;
@property (nonatomic, strong) GLDTweenSelector* repeatSelector;
@property (nonatomic, strong) GLDTweenSelector* completionSelector;

@end
