//
//  GLDTweenBlock.h
//  GLDTween
//
//  Created by Takayuki Fukatsu on 2014/10/01.
//  Copyright (c) 2014 THE GUILD. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface GLDTweenBlock : NSObject

@property (nonatomic, copy)void (^block)(void);

- (id)initWithBlock:(void(^)(void))block;
+ (GLDTweenBlock *)block:(void(^)(void))block;
- (void)execute;

@end
