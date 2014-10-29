//
//  GLDTween.m
//  GLDTween
//
//  Created by Takayuki Fukatsu on 2014/10/01.
//  Copyright (c) 2014 THE GUILD. All rights reserved.
//

#import "GLDTween.h"
#import "GLDTweenProperty.h"
#import "GLDTweenPropertyPlugin.h"
#import "GLDEasingPlugin.h"


NSString *const GLDEasingTypeEaseNone = @"EaseNone";
NSString *const GLDEasingTypeEaseInQuad = @"EaseInQuad";
NSString *const GLDEasingTypeEaseOutQuad = @"EaseOutQuad";
NSString *const GLDEasingTypeEaseInOutQuad = @"EaseInOutQuad";
NSString *const GLDEasingTypeEaseInCubic = @"EaseInCubic";
NSString *const GLDEasingTypeEaseOutCubic = @"EaseOutCubic";
NSString *const GLDEasingTypeEaseInOutCubic = @"EaseInOutCubic";
NSString *const GLDEasingTypeEaseInQuart = @"EaseInQuart";
NSString *const GLDEasingTypeEaseOutQuart = @"EaseOutQuart";
NSString *const GLDEasingTypeEaseInOutQuart = @"EaseInOutQuart";
NSString *const GLDEasingTypeEaseInQuint = @"EaseInQuint";
NSString *const GLDEasingTypeEaseOutQuint = @"EaseOutQuint";
NSString *const GLDEasingTypeEaseInOutQuint = @"EaseInOutQuint";
NSString *const GLDEasingTypeEaseInSine = @"EaseInSine";
NSString *const GLDEasingTypeEaseOutSine = @"EaseOutSine";
NSString *const GLDEasingTypeEaseInOutSine = @"EaseInOutSine";
NSString *const GLDEasingTypeEaseInCirc = @"EaseInCirc";
NSString *const GLDEasingTypeEaseOutCirc = @"EaseOutCirc";
NSString *const GLDEasingTypeEaseInOutCirc = @"EaseInOutCirc";
NSString *const GLDEasingTypeEaseInExpo = @"EaseInExpo";
NSString *const GLDEasingTypeEaseOutExpo = @"EaseOutExpo";
NSString *const GLDEasingTypeEaseInOutExpo = @"EaseInOutExpo";
NSString *const GLDEasingTypeEaseInBack = @"EaseInBack";
NSString *const GLDEasingTypeEaseOutBack = @"EaseOutBack";
NSString *const GLDEasingTypeEaseInOutBack = @"EaseInOutBack";
NSString *const GLDEasingTypeEaseInBounce = @"EaseInBounce";
NSString *const GLDEasingTypeEaseOutBounce = @"EaseOutBounce";
NSString *const GLDEasingTypeEaseInOutBounce = @"EaseInOutBounce";
NSString *const GLDEasingTypeEaseInElastic = @"EaseInElastic";
NSString *const GLDEasingTypeEaseOutElastic = @"EaseOutElastic";
NSString *const GLDEasingTypeEaseInOutElastic = @"EaseInOutElastic";

NSString *const GLDTweenParamDuration = @"duration";
NSString *const GLDTweenParamDelay = @"delay";
NSString *const GLDTweenParamRepeat = @"repeat";
NSString *const GLDTweenParamEasing = @"easing";
NSString *const GLDTweenParamRounded = @"rounded";
NSString *const GLDTweenParamStartSelector = @"startSelector";
NSString *const GLDTweenParamUpdateSelector = @"updateSelector";
NSString *const GLDTweenParamRepeatSelector = @"repeatSelector";
NSString *const GLDTweenParamCompletionSelector = @"completionSelector";
NSString *const GLDTweenParamStartBlock = @"startBlock";
NSString *const GLDTweenParamUpdateBlock = @"updateBlock";
NSString *const GLDTweenParamRepeatBlock = @"repeatBlock";
NSString *const GLDTweenParamCompletionBlock = @"completionBLock";
NSString *const GLDTweenParamRepeatsDelay = @"repeatsDelay";
NSString *const GLDTweenParamLocksInteraction = @"locksInteraction";
NSString *const GLDTweenParamUnlocksInteraction = @"unlocksInteraction";


@implementation GLDTween


//Time Management
CADisplayLink *displayLink;
NSTimeInterval currentTime;

//Data Containers
NSMutableArray *tweens;
NSMutableDictionary *easings;
NSMutableDictionary *specialProperties;

//Name Table
NSMutableArray *easingNames;
NSMutableDictionary *reservedPropertyNames;


#pragma mark - Public 


/**
 アニメーションの登録。
 
 @param target アニメーションの対象となるオブジェクト
 @param params アニメーションのパラメータとなるNSDictionary
 @return BOOL アニメーションの登録に成功したかのBOOL値
 */
+ (BOOL)addTween:(NSObject *)target withParams:(NSDictionary *)params {
    return [[GLDTween sharedEngine] addTween:target withParams:params];
}


+ (BOOL)removeTween:(NSObject *)target {
    return [[GLDTween sharedEngine] removeTween:target];
}


+ (BOOL)removeTweens:(NSArray *)targets {
    return [[GLDTween sharedEngine] removeTweens:targets];
}


+ (BOOL)removeTween:(NSObject *)target withProps:(NSArray *)props {
    return [[GLDTween sharedEngine] removeTween:target withProps:props];
}


+ (BOOL)removeAllTweens {
    return [[GLDTween sharedEngine] removeAllTweens];
}


+ (BOOL)pauseTween:(NSObject *)target {
    return [[GLDTween sharedEngine] pauseTween:target];
}


+ (BOOL)pauseTweens:(NSArray *)targets {
    return [[GLDTween sharedEngine] pauseTweens:targets];
}


+ (BOOL)pauseAllTweens {
    return [[GLDTween sharedEngine] pauseAllTweens];
}


+ (BOOL)resumeTween:(NSObject *)target {
    return [[GLDTween sharedEngine] resumeTween:target];
}


+ (BOOL)resumeTweens:(NSArray *)targets {
    return [[GLDTween sharedEngine] resumeTweens:targets];
}


+ (BOOL)resumeAllTweens {
    return [[GLDTween sharedEngine] resumeAllTweens];
}


+ (NSArray *)easingNames {
    return [[GLDTween sharedEngine] easingNames];
}


+ (BOOL)isTweening:(NSObject *)target {
    return [[GLDTween sharedEngine] isTweening:target];
}


/**
 Register custom Easing Curve as plugin.
 
 @param Class that extends GLDTweenEasingPlugin
 @param Name of Easing
 @return BOOL success
 */
+ (BOOL)registerEasingPlugin:(Class)class forKey:(NSString *)key {
    return [[GLDTween sharedEngine] registerEasingPlugin:class forKey:key];
}


/**
 Register custom Property behavior.
 
 @param Class that extends GLDTweenSpecialPropertyPlugin
 @param Name of property.
 @return BOOL success
 */
+ (BOOL)registerSpecialPropertyPlugin:(Class)class forKey:(NSString *)key {
    return [[GLDTween sharedEngine] registerSpecialPropertyPlugin:class forKey:key];
}


#pragma mark - Private Add


- (BOOL)addTween:(NSObject *)target withParams:(NSDictionary *)params {
    float duration = [[params objectForKey:GLDTweenParamDuration] floatValue];
    float delay = [[params objectForKey:GLDTweenParamDelay] floatValue];
    
    //Create Tween Object
    GLDTweenTween *tween = [[GLDTweenTween alloc] init];
    tween.target = target;
    tween.startTime = currentTime + delay;
    tween.completeTime = currentTime + delay + duration;
    tween.repeat = [[params objectForKey:GLDTweenParamRepeat] intValue];
    tween.easing = [params objectForKey:GLDTweenParamEasing] ? (NSString *)[params objectForKey:GLDTweenParamEasing] : GLDEasingTypeEaseNone;
    if (!easings[tween.easing]) {
        [self logWarning:[NSString stringWithFormat:@"Specified easing not exists %@ %@.", target, tween.easing]];
        tween.easing = GLDEasingTypeEaseNone;
    }
    tween.rounded = [params objectForKey:GLDTweenParamRounded] ? true : false;
    tween.repeatsDelay = [params objectForKey:GLDTweenParamRepeatsDelay] ? true : false;
    tween.locksInteraction = [params objectForKey:GLDTweenParamLocksInteraction] ? true : false;
    tween.unlocksInteraction = [params objectForKey:GLDTweenParamUnlocksInteraction] ? true : false;
    tween.delay = delay;
    
    //Setup Event Handler
    tween.startSelector = [params objectForKey:GLDTweenParamStartSelector];
    tween.updateSelector = [params objectForKey:GLDTweenParamUpdateSelector];
    tween.repeatSelector = [params objectForKey:GLDTweenParamRepeatSelector];
    tween.completionSelector = [params objectForKey:GLDTweenParamCompletionSelector];
    tween.startBlock = [params objectForKey:GLDTweenParamStartBlock];
    tween.updateBlock = [params objectForKey:GLDTweenParamUpdateBlock];
    tween.repeatBlock = [params objectForKey:GLDTweenParamRepeatBlock];
    tween.completionBlock = [params objectForKey:GLDTweenParamCompletionBlock];

    //Insert Animatable Property
    for (NSString *key in params) {
        NSValue *value = [params objectForKey:key];
        GLDTweenProperty *property;

        //NSLog(@"-----------");
        //NSLog(@"Key %@",key);
        if ([self isReservedPropertyName:key]) {
            //This word is reserved. we don't treat it as animatable property.
            continue;
        } else {
            //This word is registerd as Special Property we use them instead
            if (specialProperties[key]) {
                NSString *specialPropertyClassName = specialProperties[key];
                Class specialPropertyClass = NSClassFromString(specialPropertyClassName);
                property = [[specialPropertyClass alloc] init];
            } else {
                
                @try {
                    [tween.target valueForKey:key];
                }
                @catch (NSException  *e) {
                    [self logWarning:[NSString stringWithFormat:@"Tween property '%@' does not exists on %@. This will be ignored.", key, target.description]];
                    continue;
                }
                
                if ([value isKindOfClass:[NSNumber class]]) {
                    property = [[GLDTweenPropertyCGFloat alloc] init];
                } else if ([value isKindOfClass:[NSValue class]]) {
                    if (strcmp(value.objCType, @encode(CGPoint)) == 0) {
                        //CGPoint
                        property = [[GLDTweenPropertyCGPoint alloc] init];
                    } else if (strcmp(value.objCType, @encode(CGSize)) == 0) {
                        //CGSize
                        property = [[GLDTweenPropertyCGSize alloc] init];
                    } else if (strcmp(value.objCType, @encode(CGRect)) == 0) {
                        //CGRect
                        property = [[GLDTweenPropertyCGRect alloc] init];
                    } else if (strcmp(value.objCType, @encode(CGAffineTransform)) == 0) {
                        //CGAffineTransform
                        property = [[GLDTweenPropertyCGAffineTransform alloc] init];
                    } else if (strcmp(value.objCType, @encode(CATransform3D)) == 0) {
                        //CATranform3D
                        property = [[GLDTweenPropertyCATransform3D alloc] init];
                    } else {
                        //Unknown DataType
                        [self logWarning:[NSString stringWithFormat:@"Wrong Data Type %@ %@", key, value]];
                        return false;
                    }
                } else {
                    [self logWarning:[NSString stringWithFormat:@"Wrong Data Type %@ %@", key, value]];
                    return false;
                }
            }
            property.key = key;
            property.startValue = [property valueForTarget:target key:key];
            property.completeValue = value;
            property.rounded = tween.rounded;
        }
        if (property != nil) {
            [tween.properties setObject:property forKey:key];
        }
    }
    
    if (tween.locksInteraction) {
        [[UIApplication sharedApplication] beginIgnoringInteractionEvents];
    }
    
    //Add Tween
    [tweens addObject:tween];
    
    if (duration == 0.0 && delay == 0.0) {
        //quick execution for 0 duration.
        int index = tweens.count - 1.0;
        [self updateTweenByIndex:index];
        [self killTweenByIndex:index];
    }
    return true;
}


#pragma mark - Private Pause


- (BOOL)pauseTween:(NSObject *)target {
    BOOL result = NO;
    for (int i = 0; i < tweens.count; i++) {
        GLDTweenTween *tween = (GLDTweenTween *)tweens[i];
        if (target == tween.target && !tween.isPaused) {
            [self pauseTweenByIndex:i];
            result = YES;
        }
    }
    return result;
}


- (BOOL)pauseTweens:(NSArray *)targets {
    BOOL result = NO;
    for (int i = 0; i < targets.count; i++) {
        if ([self pauseTween:targets[i]]) {
            result = YES;
        }
    }
    return  result;
}


- (BOOL)pauseAllTweens {
    BOOL result = NO;
    for (int i = 0; i < tweens.count; i++) {
        GLDTweenTween*tween = (GLDTweenTween *)tweens[i];
        if (!tween.isPaused) {
            [self pauseTweenByIndex:i];
            result = YES;
        }
    }
    return  result;
}


- (BOOL)resumeTween:(NSObject *)target {
    BOOL result = NO;
    for (int i = 0; i < tweens.count; i++) {
        GLDTweenTween *tween = (GLDTweenTween *)tweens[i];
        if (target == tween.target && tween.isPaused) {
            [self resumeTweenByIndex:i];
            result = YES;
        }
    }
    return result;
}


- (BOOL)resumeTweens:(NSArray *)targets {
    BOOL result = NO;
    for (int i = 0; i < targets.count; i++) {
        if ([self resumeTween:targets[i]]) {
            result = YES;
        }
    }
    return  result;
}


- (BOOL)resumeAllTweens {
    BOOL result = NO;
    for (int i = 0; i < tweens.count; i++) {
        GLDTweenTween*tween = (GLDTweenTween *)tweens[i];
        if (tween.isPaused) {
            [self resumeTweenByIndex:i];
            result = YES;
        }
    }
    return  result;
}


#pragma mark - Private Remove


- (BOOL)removeTween:(NSObject *)target {
    BOOL result = NO;
    for (int i = 0; i < tweens.count; i++) {
        GLDTweenTween *tween = (GLDTweenTween *)tweens[i];
        if (target == tween.target && !tween.killFlag) {
            [self killTweenByIndex:i];
            result = YES;
        }
    }
    return result;
}


- (BOOL)removeTweens:(NSArray *)targets {
    BOOL result = NO;
    for (int i = 0; i < targets.count; i++) {
        if ([self removeTween:targets[i]]) {
            result = YES;
        }
    }
    return  result;
}

- (BOOL)removeTween:(NSObject *)target withProps:(NSArray *)props {
    BOOL result = false;
    for (int i = 0; i < tweens.count; i++) {
        GLDTweenTween *tween = (GLDTweenTween *)tweens[i];
        if (target == tween.target && !tween.killFlag) {
            for (int j = 0; j < props.count; j++) {
                NSString *key = props[j];
                if (tween.properties[key]) {
                    [tween.properties removeObjectForKey:key];
                    result = true;
                }
            }
            if (tween.properties.count == 0) {
                [self killTweenByIndex:i];
                result = true;
            }
        }
    }
    return  result;
}


//Method for overwrite
- (BOOL)removeConflictedTweenWithTween:(GLDTweenTween *)tween {
    BOOL result = NO;
    for (int i = 0; i < tweens.count; i++) {
        GLDTweenTween *tw = tweens[i];
        if (tween == tw) {
            continue;
        }
        if (tween.target != tw.target) {
            continue;
        }
        if (tw.startTime < tween.startTime && tw.completeTime > tween.startTime) {
            //Need Overwrite
            NSArray *keys = [tw.properties allKeys];
            for (NSString*key in keys) {
                if (tween.properties[key]) {
                    //Remove property from old tween
                    [self logWarning:[NSString stringWithFormat:@"Duplicated property '%@' was over written.",key]];
                    [tw.properties removeObjectForKey:key];
                    result = YES;
                }
            }
            if (tw.properties.count == 0) {
                //NSLog(@"競合するTween%@を削除 %d",tw, i);
                [self killTweenByIndex:i];
            }
        }
    }
    return result;
}


- (BOOL)removeAllTweens {
    BOOL result = NO;
    for (int i = 0; i < tweens.count; i++) {
        if (!((GLDTweenTween *)tweens[i]).killFlag) {
            [self killTweenByIndex:i];
            result = YES;
        }
    }
    return result;
}


#warning needs optimization
- (BOOL)isTweening:(NSObject *)target {
    for (int i = 0; i < tweens.count; i++) {
        GLDTweenTween *tw = (GLDTweenTween *)tweens[i];
        if (tw.target == target && !tw.killFlag) {
            return YES;
        }
    }
    return NO;
}


#pragma mark - Private Init


+ (GLDTween *)sharedEngine {
    static GLDTween *sharedEngine = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedEngine = [[GLDTween alloc] init];
    });
    return sharedEngine;
}


- (id)init {
    if (self = [super init]) {
        tweens = [[NSMutableArray alloc] initWithCapacity:100];
        easings = [[NSMutableDictionary alloc] initWithCapacity:10];
        easingNames = [[NSMutableArray alloc] initWithCapacity:10];
        specialProperties = [[NSMutableDictionary alloc] initWithCapacity:10];
        reservedPropertyNames = [[NSMutableDictionary alloc] initWithCapacity:10];
        
        //Register reserved property name
        [self registerReservedPropertyName:GLDTweenParamDuration];
        [self registerReservedPropertyName:GLDTweenParamDelay];
        [self registerReservedPropertyName:GLDTweenParamEasing];
        [self registerReservedPropertyName:GLDTweenParamRepeat];
        [self registerReservedPropertyName:GLDTweenParamRounded];
        [self registerReservedPropertyName:GLDTweenParamStartBlock];
        [self registerReservedPropertyName:GLDTweenParamUpdateBlock];
        [self registerReservedPropertyName:GLDTweenParamRepeatBlock];
        [self registerReservedPropertyName:GLDTweenParamCompletionBlock];
        [self registerReservedPropertyName:GLDTweenParamStartSelector];
        [self registerReservedPropertyName:GLDTweenParamUpdateSelector];
        [self registerReservedPropertyName:GLDTweenParamRepeatSelector];
        [self registerReservedPropertyName:GLDTweenParamCompletionSelector];
        [self registerReservedPropertyName:GLDTweenParamRepeatsDelay];
        [self registerReservedPropertyName:GLDTweenParamLocksInteraction];
        [self registerReservedPropertyName:GLDTweenParamUnlocksInteraction];
        
        //Register easing plugin
        [self registerEasingPlugin:[GLDEasingNone class] forKey:GLDEasingTypeEaseNone];
        [self registerEasingPlugin:[GLDEasingInQuad class] forKey:GLDEasingTypeEaseInQuad];
        [self registerEasingPlugin:[GLDEasingOutQuad class] forKey:GLDEasingTypeEaseOutQuad];
        [self registerEasingPlugin:[GLDEasingInOutQuad class] forKey:GLDEasingTypeEaseInOutQuad];
        [self registerEasingPlugin:[GLDEasingInCubic class] forKey:GLDEasingTypeEaseInCubic];
        [self registerEasingPlugin:[GLDEasingOutCubic class] forKey:GLDEasingTypeEaseOutCubic];
        [self registerEasingPlugin:[GLDEasingInOutCubic class] forKey:GLDEasingTypeEaseInOutCubic];
        [self registerEasingPlugin:[GLDEasingInQuart class] forKey:GLDEasingTypeEaseInQuart];
        [self registerEasingPlugin:[GLDEasingOutQuart class] forKey:GLDEasingTypeEaseOutQuart];
        [self registerEasingPlugin:[GLDEasingInOutQuart class] forKey:GLDEasingTypeEaseInOutQuart];
        [self registerEasingPlugin:[GLDEasingInQuint class] forKey:GLDEasingTypeEaseInQuint];
        [self registerEasingPlugin:[GLDEasingOutQuint class] forKey:GLDEasingTypeEaseOutQuint];
        [self registerEasingPlugin:[GLDEasingInOutQuint class] forKey:GLDEasingTypeEaseInOutQuint];
        [self registerEasingPlugin:[GLDEasingInSine class] forKey:GLDEasingTypeEaseInSine];
        [self registerEasingPlugin:[GLDEasingOutSine class] forKey:GLDEasingTypeEaseOutSine];
        [self registerEasingPlugin:[GLDEasingInOutSine class] forKey:GLDEasingTypeEaseInOutSine];
        [self registerEasingPlugin:[GLDEasingInCirc class] forKey:GLDEasingTypeEaseInCirc];
        [self registerEasingPlugin:[GLDEasingOutCirc class] forKey:GLDEasingTypeEaseOutCirc];
        [self registerEasingPlugin:[GLDEasingInOutCirc class] forKey:GLDEasingTypeEaseInOutCirc];
        [self registerEasingPlugin:[GLDEasingInExpo class] forKey:GLDEasingTypeEaseInExpo];
        [self registerEasingPlugin:[GLDEasingOutExpo class] forKey:GLDEasingTypeEaseOutExpo];
        [self registerEasingPlugin:[GLDEasingInOutExpo class] forKey:GLDEasingTypeEaseInOutExpo];
        [self registerEasingPlugin:[GLDEasingInBack class] forKey:GLDEasingTypeEaseInBack];
        [self registerEasingPlugin:[GLDEasingOutBack class] forKey:GLDEasingTypeEaseOutBack];
        [self registerEasingPlugin:[GLDEasingInOutBack class] forKey:GLDEasingTypeEaseInOutBack];
        [self registerEasingPlugin:[GLDEasingInBounce class] forKey:GLDEasingTypeEaseInBounce];
        [self registerEasingPlugin:[GLDEasingOutBounce class] forKey:GLDEasingTypeEaseOutBounce];
        [self registerEasingPlugin:[GLDEasingInOutBounce class] forKey:GLDEasingTypeEaseInOutBounce];
        [self registerEasingPlugin:[GLDEasingInElastic class] forKey:GLDEasingTypeEaseInElastic];
        [self registerEasingPlugin:[GLDEasingOutElastic class] forKey:GLDEasingTypeEaseOutElastic];
        [self registerEasingPlugin:[GLDEasingInOutElastic class] forKey:GLDEasingTypeEaseInOutElastic];
        
        //Register special property
        [self registerSpecialPropertyPlugin:[GLDTweenPropertyX class] forKey:@"x"];
        [self registerSpecialPropertyPlugin:[GLDTweenPropertyY class] forKey:@"y"];
        [self registerSpecialPropertyPlugin:[GLDTweenPropertyWidth class] forKey:@"width"];
        [self registerSpecialPropertyPlugin:[GLDTweenPropertyHeight class] forKey:@"height"];
        [self registerSpecialPropertyPlugin:[GLDTweenPropertyCenterX class] forKey:@"centerX"];
        [self registerSpecialPropertyPlugin:[GLDTweenPropertyCenterY class] forKey:@"centerY"];
        [self registerSpecialPropertyPlugin:[GLDTweenPropertyTransform3D class] forKey:@"transform3d"];
        
        [self start];
    }
    return self;
}


#pragma mark - Private Plugins


- (BOOL)registerEasingPlugin:(Class)class forKey:(NSString *)key {
    #warning Show Warning and override when same keyname is given.
    GLDEasing *easing = [[class alloc] init];
    [easings setObject:easing forKey:key];
    [easingNames addObject:key];
    return YES;
}


- (BOOL)registerSpecialPropertyPlugin:(Class)class forKey:(NSString *)key {
    #warning Show Warning and override when same keyname is given.
    NSString *className = NSStringFromClass(class);
    [specialProperties setObject:className forKey:key];
    return YES;
}


- (BOOL)registerReservedPropertyName:(NSString *)name {
    [reservedPropertyNames setObject:@YES forKey:name];
    return YES;
}


#pragma mark - Private Internal Manipulation


- (BOOL)pauseTweenByIndex:(int)index {
    GLDTweenTween *tween = (GLDTweenTween *)tweens[index];
    if (tween.isPaused) {
        return NO;
    }
    tween.pausedTime = currentTime;
    tween.paused = YES;
    return YES;
}


- (BOOL)resumeTweenByIndex:(int)index {
    GLDTweenTween *tween = (GLDTweenTween *)tweens[index];
    if (!tween.isPaused) {
        return false;
    }
    tween.startTime = tween.startTime + currentTime - tween.completeTime;
    tween.completeTime = tween.completeTime + currentTime - tween.pausedTime;
    tween.pausedTime = 0;
    tween.paused = false;
    return YES;
}


- (BOOL)killTweenByIndex:(int)index {
    GLDTweenTween *tween = tweens[index];
    if (tween.unlocksInteraction) {
        [[UIApplication sharedApplication] endIgnoringInteractionEvents];
    }
    tween.killFlag = YES;
    return YES;
}


- (BOOL)teardownTween:(GLDTweenTween *)tween {
    [tweens removeObject:tween];
    return YES;
}


#pragma mark - Private Update


- (void)start {
    if (displayLink) {
        [displayLink invalidate];
    } 
    displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(update:)];
    [displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
    [self update:nil];
}


- (void)update:(id)sender {
    [self updateTimestamp];
    [self updateTweens];
    [self teardownTweens];
}


- (void)updateTimestamp {
    currentTime = [[NSDate date] timeIntervalSince1970];
}


- (void)updateTweens {
    for (int i = 0; i < tweens.count; i++) {
        GLDTweenTween *tween = tweens[i];
        if (!tween.isPaused && !tween.killFlag) {
            [self updateTweenByIndex:i];
        }
    }
}


/**
 Cleanup killed tween from data
 */
- (BOOL)teardownTweens {
    BOOL result = NO;
    for (long i = tweens.count - 1; i > -1; i--) {
        GLDTweenTween *tween = tweens[i];
        if (tween.killFlag) {
            [self teardownTween:tween];
        }
        result = YES;
    }
    return result;
}


- (BOOL)updateTweenByIndex:(int)index {
    GLDTweenTween *tween = tweens[index];
    BOOL willComplete = NO;
    
    if (currentTime >= tween.completeTime) {
        willComplete = YES;
    }
    
    //Update
    if (tween.startTime <= currentTime) {
        if (!tween.hasStarted) {
            for (NSString *key in tween.properties) {
                GLDTweenProperty *property = [tween.properties objectForKey:key];
                [property updateStartValueForTarget:tween.target key:key];
            }
            tween.started = YES;
            
            [self removeConflictedTweenWithTween:tween];
            
            //Invoke Start Block and Selector
            if (tween.startBlock) {
                [tween.startBlock execute];
            }
            if (tween.startSelector) {
                [tween.startSelector perform];
            }
        }
        
        //Inject Tween
        float t = currentTime - tween.startTime;
        float d = tween.completeTime - tween.startTime;
        GLDEasing *ease = easings[tween.easing];
        for (NSString *key in tween.properties) {
            GLDTweenProperty *property = [tween.properties objectForKey:key];
            if (willComplete) {
                [property setCompleteValueForTarget:tween.target key:key];
            } else {
                [property setTweenValueForTarget:tween.target key:key time:t duration:d ease:ease];
            }
        }
        
        //Update Callback
        if (tween.updateBlock) {
            [tween.updateBlock execute];
        }
        if (tween.updateSelector) {
            [tween.updateSelector perform];
        }
    }
    
    
    
    if (willComplete == YES) {
        //Repeat
        
        if (tween.repeat != 0) {
            if (tween.repeat > 0) {
                tween.repeat--;
            }
            tween.completed = false;
            tween.completeTime = (tween.completeTime - tween.startTime) + currentTime;
            tween.startTime = currentTime;
            if (tween.repeatsDelay) {
                tween.completeTime += tween.delay;
                tween.startTime += tween.delay;
            }
            if (tween.repeatBlock) {
                [tween.repeatBlock execute];
            }
            if (tween.repeatSelector) {
                [tween.completionSelector perform];
            }
            return true;
        }
        tween.completed = YES;
        
        //Invoke Completion Completion Selector and Block
        if (tween.completionBlock) {
            [tween.completionBlock execute];
        }
        if (tween.completionSelector) {
            [tween.completionSelector perform];
        }
        
        [self killTweenByIndex:index];
    }
    
    return false;
}


#pragma mark - Private Helper


- (NSArray *)easingNames {
    return easingNames;
}


- (BOOL)isReservedPropertyName:(NSString *)name {
    return reservedPropertyNames[name] ? YES : NO;
}


- (void)logWarning:(NSString *)string {
    NSString *warning = [NSString stringWithFormat:@"WARNING: %@",string];
    NSLog(@"%@",warning);
}


@end

