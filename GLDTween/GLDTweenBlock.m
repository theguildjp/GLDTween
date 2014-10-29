//
//  GLDTweenBlock.m
//  GLDTween
//
//  Created by Takayuki Fukatsu on 2014/10/01.
//  Copyright (c) 2014 THE GUILD. All rights reserved.
//

#import "GLDTweenBLock.h"


@implementation GLDTweenBlock


- (id)initWithBlock:(void(^)(void))block {
    if (self = [super init]) {
        self.block = block;
    }
    return self;
}


+ (GLDTweenBlock *)block:(void(^)(void))block {
    return [[GLDTweenBlock alloc] initWithBlock:block];
}


- (void)execute {
    self.block();
}


@end
