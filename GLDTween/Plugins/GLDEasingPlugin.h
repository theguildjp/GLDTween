//
//  GLDEasingPlugin.h
//  GLDTween
//
//  Created by Takayuki Fukatsu on 2014/10/01.
//  Copyright (c) 2014 THE GUILD. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface GLDEasingFunction : NSObject
- (float)t:(float)t b:(float)b c:(float)c d:(float)d;
@end

@interface GLDEasingFunctionNone : GLDEasingFunction
- (float)t:(float)t b:(float)b c:(float)c d:(float)d;
@end

@interface GLDEasingFunctionInQuad : GLDEasingFunction
- (float)t:(float)t b:(float)b c:(float)c d:(float)d;
@end

@interface GLDEasingFunctionOutQuad : GLDEasingFunction
- (float)t:(float)t b:(float)b c:(float)c d:(float)d;
@end

@interface GLDEasingFunctionInOutQuad: GLDEasingFunction
- (float)t:(float)t b:(float)b c:(float)c d:(float)d;
@end

@interface GLDEasingFunctionInCubic : GLDEasingFunction
- (float)t:(float)t b:(float)b c:(float)c d:(float)d;
@end

@interface GLDEasingFunctionOutCubic : GLDEasingFunction
- (float)t:(float)t b:(float)b c:(float)c d:(float)d;
@end

@interface GLDEasingFunctionInOutCubic: GLDEasingFunction
- (float)t:(float)t b:(float)b c:(float)c d:(float)d;
@end

@interface GLDEasingFunctionInQuart : GLDEasingFunction
- (float)t:(float)t b:(float)b c:(float)c d:(float)d;
@end

@interface GLDEasingFunctionOutQuart : GLDEasingFunction
- (float)t:(float)t b:(float)b c:(float)c d:(float)d;
@end

@interface GLDEasingFunctionInOutQuart: GLDEasingFunction
- (float)t:(float)t b:(float)b c:(float)c d:(float)d;
@end

@interface GLDEasingFunctionInQuint : GLDEasingFunction
- (float)t:(float)t b:(float)b c:(float)c d:(float)d;
@end

@interface GLDEasingFunctionOutQuint : GLDEasingFunction
- (float)t:(float)t b:(float)b c:(float)c d:(float)d;
@end

@interface GLDEasingFunctionInOutQuint: GLDEasingFunction
- (float)t:(float)t b:(float)b c:(float)c d:(float)d;
@end

@interface GLDEasingFunctionInSine : GLDEasingFunction
- (float)t:(float)t b:(float)b c:(float)c d:(float)d;
@end

@interface GLDEasingFunctionOutSine : GLDEasingFunction
- (float)t:(float)t b:(float)b c:(float)c d:(float)d;
@end

@interface GLDEasingFunctionInOutSine: GLDEasingFunction
- (float)t:(float)t b:(float)b c:(float)c d:(float)d;
@end

@interface GLDEasingFunctionInExpo : GLDEasingFunction
- (float)t:(float)t b:(float)b c:(float)c d:(float)d;
@end

@interface GLDEasingFunctionOutExpo : GLDEasingFunction
- (float)t:(float)t b:(float)b c:(float)c d:(float)d;
@end

@interface GLDEasingFunctionInOutExpo: GLDEasingFunction
- (float)t:(float)t b:(float)b c:(float)c d:(float)d;
@end

@interface GLDEasingFunctionInCirc : GLDEasingFunction
- (float)t:(float)t b:(float)b c:(float)c d:(float)d;
@end

@interface GLDEasingFunctionOutCirc : GLDEasingFunction
- (float)t:(float)t b:(float)b c:(float)c d:(float)d;
@end

@interface GLDEasingFunctionInOutCirc: GLDEasingFunction
- (float)t:(float)t b:(float)b c:(float)c d:(float)d;
@end

@interface GLDEasingFunctionInBack : GLDEasingFunction
- (float)t:(float)t b:(float)b c:(float)c d:(float)d;
@end

@interface GLDEasingFunctionOutBack : GLDEasingFunction
- (float)t:(float)t b:(float)b c:(float)c d:(float)d;
@end

@interface GLDEasingFunctionInOutBack: GLDEasingFunction
- (float)t:(float)t b:(float)b c:(float)c d:(float)d;
@end

@interface GLDEasingFunctionInBounce : GLDEasingFunction
- (float)t:(float)t b:(float)b c:(float)c d:(float)d;
@end

@interface GLDEasingFunctionOutBounce : GLDEasingFunction
- (float)t:(float)t b:(float)b c:(float)c d:(float)d;
@end

@interface GLDEasingFunctionInOutBounce: GLDEasingFunction
- (float)t:(float)t b:(float)b c:(float)c d:(float)d;
@end

@interface GLDEasingFunctionInElastic : GLDEasingFunction
- (float)t:(float)t b:(float)b c:(float)c d:(float)d;
@end

@interface GLDEasingFunctionOutElastic : GLDEasingFunction
- (float)t:(float)t b:(float)b c:(float)c d:(float)d;
@end

@interface GLDEasingFunctionInOutElastic: GLDEasingFunction
- (float)t:(float)t b:(float)b c:(float)c d:(float)d;
@end
