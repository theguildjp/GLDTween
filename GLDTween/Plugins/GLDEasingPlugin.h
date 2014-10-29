//
//  GLDEasing.h
//  GLDTween
//
//  Created by 深津 貴之 on 2014/10/01.
//  Copyright (c) 2014年 THE GUILD. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface GLDEasing : NSObject
- (float)t:(float)t b:(float)b c:(float)c d:(float)d;
@end

@interface GLDEasingNone : GLDEasing
- (float)t:(float)t b:(float)b c:(float)c d:(float)d;
@end

@interface GLDEasingInQuad : GLDEasing
- (float)t:(float)t b:(float)b c:(float)c d:(float)d;
@end

@interface GLDEasingOutQuad : GLDEasing
- (float)t:(float)t b:(float)b c:(float)c d:(float)d;
@end

@interface GLDEasingInOutQuad: GLDEasing
- (float)t:(float)t b:(float)b c:(float)c d:(float)d;
@end

@interface GLDEasingInCubic : GLDEasing
- (float)t:(float)t b:(float)b c:(float)c d:(float)d;
@end

@interface GLDEasingOutCubic : GLDEasing
- (float)t:(float)t b:(float)b c:(float)c d:(float)d;
@end

@interface GLDEasingInOutCubic: GLDEasing
- (float)t:(float)t b:(float)b c:(float)c d:(float)d;
@end

@interface GLDEasingInQuart : GLDEasing
- (float)t:(float)t b:(float)b c:(float)c d:(float)d;
@end

@interface GLDEasingOutQuart : GLDEasing
- (float)t:(float)t b:(float)b c:(float)c d:(float)d;
@end

@interface GLDEasingInOutQuart: GLDEasing
- (float)t:(float)t b:(float)b c:(float)c d:(float)d;
@end

@interface GLDEasingInQuint : GLDEasing
- (float)t:(float)t b:(float)b c:(float)c d:(float)d;
@end

@interface GLDEasingOutQuint : GLDEasing
- (float)t:(float)t b:(float)b c:(float)c d:(float)d;
@end

@interface GLDEasingInOutQuint: GLDEasing
- (float)t:(float)t b:(float)b c:(float)c d:(float)d;
@end

@interface GLDEasingInSine : GLDEasing
- (float)t:(float)t b:(float)b c:(float)c d:(float)d;
@end

@interface GLDEasingOutSine : GLDEasing
- (float)t:(float)t b:(float)b c:(float)c d:(float)d;
@end

@interface GLDEasingInOutSine: GLDEasing
- (float)t:(float)t b:(float)b c:(float)c d:(float)d;
@end

@interface GLDEasingInExpo : GLDEasing
- (float)t:(float)t b:(float)b c:(float)c d:(float)d;
@end

@interface GLDEasingOutExpo : GLDEasing
- (float)t:(float)t b:(float)b c:(float)c d:(float)d;
@end

@interface GLDEasingInOutExpo: GLDEasing
- (float)t:(float)t b:(float)b c:(float)c d:(float)d;
@end

@interface GLDEasingInCirc : GLDEasing
- (float)t:(float)t b:(float)b c:(float)c d:(float)d;
@end

@interface GLDEasingOutCirc : GLDEasing
- (float)t:(float)t b:(float)b c:(float)c d:(float)d;
@end

@interface GLDEasingInOutCirc: GLDEasing
- (float)t:(float)t b:(float)b c:(float)c d:(float)d;
@end

@interface GLDEasingInBack : GLDEasing
- (float)t:(float)t b:(float)b c:(float)c d:(float)d;
@end

@interface GLDEasingOutBack : GLDEasing
- (float)t:(float)t b:(float)b c:(float)c d:(float)d;
@end

@interface GLDEasingInOutBack: GLDEasing
- (float)t:(float)t b:(float)b c:(float)c d:(float)d;
@end

@interface GLDEasingInBounce : GLDEasing
- (float)t:(float)t b:(float)b c:(float)c d:(float)d;
@end

@interface GLDEasingOutBounce : GLDEasing
- (float)t:(float)t b:(float)b c:(float)c d:(float)d;
@end

@interface GLDEasingInOutBounce: GLDEasing
- (float)t:(float)t b:(float)b c:(float)c d:(float)d;
@end

@interface GLDEasingInElastic : GLDEasing
- (float)t:(float)t b:(float)b c:(float)c d:(float)d;
@end

@interface GLDEasingOutElastic : GLDEasing
- (float)t:(float)t b:(float)b c:(float)c d:(float)d;
@end

@interface GLDEasingInOutElastic: GLDEasing
- (float)t:(float)t b:(float)b c:(float)c d:(float)d;
@end