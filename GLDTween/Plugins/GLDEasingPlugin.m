//
//  GLDEasingPlugin.m
//  GLDTween
//
//  Created by Takayuki Fukatsu on 2014/10/01.
//  Copyright (c) 2014 THE GUILD. All rights reserved.
//

#import "GLDEasingPlugin.h"


@implementation GLDEasingFunction
- (float)t:(float)t b:(float)b c:(float)c d:(float)d {
    return 0;
}
@end


@implementation GLDEasingFunctionNone
- (float)t:(float)t b:(float)b c:(float)c d:(float)d {
    return c * t / d + b;
}
@end


@implementation GLDEasingFunctionInQuad
- (float)t:(float)t b:(float)b c:(float)c d:(float)d {
    float t2 = t / d;
    return b + c * t2 * t2;
}
@end


@implementation GLDEasingFunctionOutQuad
- (float)t:(float)t b:(float)b c:(float)c d:(float)d {
    float t2 = t / d;
    return b + (-c * t2 * (t2 - 2));
}
@end


@implementation GLDEasingFunctionInOutQuad
- (float)t:(float)t b:(float)b c:(float)c d:(float)d {
    float t2 = t / d * 2;
    if (t2 < 1) {
        return c / 2 * t2 * t2 + b;
    }
    --t2;
    return - c / 2 * (t2 * (t2 - 2) - 1) + b;
}
@end


@implementation GLDEasingFunctionInCubic
- (float)t:(float)t b:(float)b c:(float)c d:(float)d {
    float t2 = t / d;
    return b + c * t2 * t2 * t2;
}
@end


@implementation GLDEasingFunctionOutCubic
- (float)t:(float)t b:(float)b c:(float)c d:(float)d {
    float t2 = t / d;
    --t2;
    return b + c * (t2 * t2 * t2 + 1);
}
@end


@implementation GLDEasingFunctionInOutCubic
- (float)t:(float)t b:(float)b c:(float)c d:(float)d {
    float t2 = t / d * 2;
    if (t2 < 1) {
        return c / 2 * t2 * t2 * t2 + b;
    }
    t2 -= 2;
    return b + c / 2 * (t2 * t2 * t2 + 2);
}
@end


@implementation GLDEasingFunctionInQuart
- (float)t:(float)t b:(float)b c:(float)c d:(float)d {
    float t2 = t / d;
    return b + c * t2 * t2 * t2 * t2;
}
@end


@implementation GLDEasingFunctionOutQuart
- (float)t:(float)t b:(float)b c:(float)c d:(float)d {
    float t2 = t / d;
    --t2;
    return b - c * (t2 * t2 * t2 * t2 - 1);
}
@end


@implementation GLDEasingFunctionInOutQuart
- (float)t:(float)t b:(float)b c:(float)c d:(float)d {
    float t2 = t / d * 2;
    if (t2 < 1) {
        return c / 2 * t2 * t2 * t2 * t2 + b;
    }
    t2 -= 2;
    return b - c / 2 * (t2 * t2 * t2 * t2 - 2);
}
@end


@implementation GLDEasingFunctionInQuint
- (float)t:(float)t b:(float)b c:(float)c d:(float)d {
    float t2 = t / d;
    return b + c * t2 * t2 * t2 * t2 * t2;
}
@end


@implementation GLDEasingFunctionOutQuint
- (float)t:(float)t b:(float)b c:(float)c d:(float)d {
    float t2 = t / d;
    --t2;
    return b + c * (t2 * t2 * t2 * t2 * t2 + 1);
}
@end


@implementation GLDEasingFunctionInOutQuint
- (float)t:(float)t b:(float)b c:(float)c d:(float)d {
    float t2 = t / d * 2;
    if (t2 < 1) {
        return c / 2 * t2 * t2 * t2 * t2 * t2 + b;
    }
    t2 -= 2;
    return b + c / 2 * (t2 * t2 * t2 * t2 * t2 + 2);
}
@end


@implementation GLDEasingFunctionInSine
- (float)t:(float)t b:(float)b c:(float)c d:(float)d {
    return -c * cos(t / d * (M_PI_2)) + c + b;
}
@end


@implementation GLDEasingFunctionOutSine
- (float)t:(float)t b:(float)b c:(float)c d:(float)d {
    return c * sin(t / d * (M_PI_2)) + b;
}
@end


@implementation GLDEasingFunctionInOutSine
- (float)t:(float)t b:(float)b c:(float)c d:(float)d {
    return -c / 2 * (cos(M_PI * t / d) - 1) + b;
}
@end


@implementation GLDEasingFunctionInExpo
- (float)t:(float)t b:(float)b c:(float)c d:(float)d {
    return c * pow(2, 10 * (t / d - 1)) + b;
}
@end


@implementation GLDEasingFunctionOutExpo
- (float)t:(float)t b:(float)b c:(float)c d:(float)d {
    return c * (-pow(2, -10 * t / d) + 1) + b;
}
@end


@implementation GLDEasingFunctionInOutExpo
- (float)t:(float)t b:(float)b c:(float)c d:(float)d {
    float t2 = t / d * 2;
    if (t2 < 1) {
        return c / 2 * pow(2, 10 * (t2 - 1)) + b;
    }
    t2--;
    return c / 2 * (-pow(2, -10 * t2) + 2) + b;
}
@end


@implementation GLDEasingFunctionInCirc
- (float)t:(float)t b:(float)b c:(float)c d:(float)d {
    float t2 = t / d;
    return -c * (sqrt(1 - t2 * t2) - 1) + b;
}
@end


@implementation GLDEasingFunctionOutCirc
- (float)t:(float)t b:(float)b c:(float)c d:(float)d {
    float t2 = t / d;
    --t2;
    return c * sqrt(1 - t2 * t2) + b;
}
@end


@implementation GLDEasingFunctionInOutCirc
- (float)t:(float)t b:(float)b c:(float)c d:(float)d {
    float t2 = t / d * 2;
    if (t2 < 1) {
        return -c / 2 * (sqrt(1 - t2 * t2) - 1) + b;
    }
    t2 -= 2;
    return c / 2 * (sqrt(1 - t2 * t2) + 1) + b;
}
@end


/*
 暫定でfeb19の式からコピー
 https://github.com/feb19/Value-Tween-Library-for-Objective-C
 */

@implementation GLDEasingFunctionInBack
- (float)t:(float)t b:(float)b c:(float)c d:(float)d {
    float s = 1.70158;
    t /= d;
    return c * t * t * ((s + 1) * t - s) + b;
}
@end


@implementation GLDEasingFunctionOutBack
- (float)t:(float)t b:(float)b c:(float)c d:(float)d {
    float s = 1.70158;
    t = t / d - 1;
    return c * (t * t * ((s + 1) * t + s) + 1) + b;
}
@end


@implementation GLDEasingFunctionInOutBack
- (float)t:(float)t b:(float)b c:(float)c d:(float)d {
    float s = 1.70158;
    float k = 1.525;
    t /= d / 2;
    s *= k;
    if (t < 1) {
        return c / 2 * (t * t * ((s + 1) * t - s)) + b;
    } else {
        t -= 2;
        return c / 2 * (t * t * ((s + 1) * t + s) + 2) + b;
    }
}
@end


#warning need optimize
@implementation GLDEasingFunctionInBounce
- (float)t:(float)t b:(float)b c:(float)c d:(float)d {
    //return c - easeOutBounce (d - t, 0, c, d) + b;
    float val = 0;
    float t2 = d - t;
    //from easeOutBounce
    t2 /= d;
    if (t2 < (1 / 2.75)) {
        val = c * (7.5625 * t2 * t2);
    } else if (t < (2 / 2.75)) {
        t2 -= (1.5 / 2.75);
        val = c * (7.5625 * t2 * t2 + .75);
    } else if (t < (2.5 / 2.75)) {
        t2 -= (2.25 / 2.75);
        val = c * (7.5625 * t2 * t2 + .9375);
    } else {
        t2 -= (2.625 / 2.75);
        val = c * (7.5625 * t2 * t2 + .984375);
    }
    
    return c - val + b;
}
@end


@implementation GLDEasingFunctionOutBounce
- (float)t:(float)t b:(float)b c:(float)c d:(float)d {
    t /= d;
    if (t < (1 / 2.75)) {
        return c * (7.5625 * t * t) + b;
    } else if (t < (2 / 2.75)) {
        t -= (1.5 / 2.75);
        return c * (7.5625 * t * t + .75) + b;
    } else if (t < (2.5 / 2.75)) {
        t -= (2.25 / 2.75);
        return c * (7.5625 * t * t + .9375) + b;
    } else {
        t -= (2.625 / 2.75);
        return c * (7.5625 * t * t + .984375) + b;
    }
}
@end


#warning need optimize
@implementation GLDEasingFunctionInOutBounce
- (float)t:(float)t b:(float)b c:(float)c d:(float)d {
    if (t < d / 2) {
        return [self inT:t * 2 b:0 c:c d:d] * 0.5 + b;
    } else {
        return [self outT:t * 2 - d b:0 c:c d:d] * 0.5 + c * 0.5 + b;
    }
}

- (float)inT:(float)t b:(float)b c:(float)c d:(float)d {
    return c - [self outT:d - t b:0 c:c d:d] + b;
}

- (float)outT:(float)t b:(float)b c:(float)c d:(float)d {
    t /= d;
    if (t < (1 / 2.75)) {
        return c * (7.5625 * t * t) + b;
    } else if (t < (2 / 2.75)) {
        t -= (1.5 / 2.75);
        return c * (7.5625 * t * t + .75) + b;
    } else if (t < (2.5 / 2.75)) {
        t -= (2.25 / 2.75);
        return c * (7.5625 * t * t + .9375) + b;
    } else {
        t -= (2.625 / 2.75);
        return c * (7.5625 * t * t + .984375) + b;
    }
}
@end


@implementation GLDEasingFunctionInElastic
- (float)t:(float)t b:(float)b c:(float)c d:(float)d {
    float s = 1.70158;
    float p = 0;
    float a = c;
    if (t == 0) return b;
    if ((t /= d) == 1) return b+c;
    if (!p) p = d * .3;
    if (a < abs(c)) {
        a = c;
        s = p / 4;
    } else {
        s = p / (2 * 3.1419) * asin (c/a);
    }
    --t;
    return -(a * pow(2, 10 * t) * sin((t * d - s) * (2 * 3.1419) / p)) + b;
}
@end


@implementation GLDEasingFunctionOutElastic
- (float)t:(float)t b:(float)b c:(float)c d:(float)d {
    float s = 1.70158;
    float p = 0;
    float a = c;
    if (t == 0) return b;
    if ((t /= d) == 1) return b+c;
    if (!p) p = d * .3;
    if (a < abs(c)) {
        a = c;
        s = p / 4;
    } else {
        s = p / (2 * 3.1419) * asin(c / a);
    };
    return a * pow(2, -10 * t) * sin((t * d - s) * (2 * 3.1419) / p) + c + b;
}
@end


@implementation GLDEasingFunctionInOutElastic
- (float)t:(float)t b:(float)b c:(float)c d:(float)d {
    float s = 1.70158;
    float p = 0;
    float a = c;
    if (t == 0) return b;
    if ((t /= d / 2) == 2) return b + c;
    if (!p) p = d * (.3 * 1.5);
    if (a < abs(c)) {
        a = c;
        s = p / 4;
    } else {
        s = p / (2 * 3.1419) * asin(c / a);
    }
    if (t < 1) {
        --t;
        return -.5 * (a * pow(2, 10 * t) * sin((t * d - s) * (2 * 3.1419) / p)) + b;
    }
    --t;
    return a * pow(2, -10 * t) * sin((t * d - s) * (2 * 3.1419) / p) * .5 + c + b;
}
@end
