//
//  GLDTweenSelector.m
//  GLDTween
//
//  Created by Takayuki Fukatsu on 2014/10/01.
//  Copyright (c) 2014年 THE GUILD. All rights reserved.
//

#import "GLDTweenSelector.h"

@implementation GLDTweenSelector

- (id)initWithSelector:(SEL)selector target:(NSObject*)target{
    self = [super init];
    if(self){
        self.selector = selector;
        self.target = target;
    }
    return self;
}

+ (GLDTweenSelector*)selector:(SEL)selector withTarget:(NSObject*)target
{
    return [[GLDTweenSelector alloc]initWithSelector:selector target:target];
}

- (void)perform{
    if([self.target respondsToSelector:self.selector]){
        #pragma clang diagnostic push
        #pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [self.target performSelector:self.selector withObject:nil];
        #pragma clang diagnostic pop
    }
}
@end
