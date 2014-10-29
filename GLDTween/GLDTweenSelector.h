//
//  GLDTweenSelector.h
//  GLDTween
//
//  Created by Takayuki Fukatsu on 2014/10/01.
//  Copyright (c) 2014年 THE GUILD. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 Simple Selector Wrapper for NSDictionary
 */
@interface GLDTweenSelector : NSObject

@property (retain,nonatomic) NSObject* target;
@property (assign,nonatomic) SEL selector;

- (id)initWithSelector:(SEL)selector target:(NSObject*)target;
- (void)perform;
+ (GLDTweenSelector*)selector:(SEL)selector withTarget:(NSObject*)target;

@end
