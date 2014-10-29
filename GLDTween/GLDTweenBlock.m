//
//  GLDTweenBLock.m
//  GLDTween
//
//  Created by 深津 貴之 on 2014/10/01.
//  Copyright (c) 2014年 THE GUILD. All rights reserved.
//

#import "GLDTweenBLock.h"

@implementation GLDTweenBlock

- (id)initWithBlock:(void(^)(void))block{
    self = [super init];
    if(self){
        self.block = block;
    }
    return self;
}

+ (GLDTweenBlock*)block:(void(^)(void))block{
    return [[GLDTweenBlock alloc]initWithBlock:block];
}

- (void)execute{
    self.block();
}

@end
