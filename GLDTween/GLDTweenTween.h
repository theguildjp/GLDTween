//
//  GLDTweenTween.h
//  GLDTween
//
//  Created by Takayuki Fukatsu on 2014/10/01.
//  Copyright (c) 2014 THE GUILD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GLDTweenSelector.h"
#import "GLDTweenBlock.h"


/**
 Animation Instance that runs on GLDTween Animation Engine
 */
@interface GLDTweenTween : NSObject

@property (strong, nonatomic) NSObject *target;
@property (strong, nonatomic) NSMutableDictionary *properties;
@property (strong, nonatomic) NSString *easing;
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
@property (strong, nonatomic) GLDTweenBlock *startBlock;
@property (strong, nonatomic) GLDTweenBlock *updateBlock;
@property (strong, nonatomic) GLDTweenBlock *repeatBlock;
@property (strong, nonatomic) GLDTweenBlock *completionBlock;


//Selectors
@property (strong, nonatomic) GLDTweenSelector *startSelector;
@property (strong, nonatomic) GLDTweenSelector *updateSelector;
@property (strong, nonatomic) GLDTweenSelector *repeatSelector;
@property (strong, nonatomic) GLDTweenSelector *completionSelector;

@end
