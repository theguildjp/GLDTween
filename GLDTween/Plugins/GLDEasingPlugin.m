//
//  GLDEasingPlugin.m
//  GLDTween
//
//  Created by Takayuki Fukatsu on 2014/10/01.
//  Copyright (c) 2014 THE GUILD. All rights reserved.
//

#import "GLDEasingPlugin.h"


@implementation GLDEasing
- (float)t:(float)t b:(float)b c:(float)c d:(float)d {
    return 0;
}
@end


@implementation GLDEasingNone
- (float)t:(float)t b:(float)b c:(float)c d:(float)d {
    return c * t / d + b;
}
@end


@implementation GLDEasingInQuad
- (float)t:(float)t b:(float)b c:(float)c d:(float)d {
    float t2 = t / d;
    return b + c * t2 * t2;
}
@end


@implementation GLDEasingOutQuad
- (float)t:(float)t b:(float)b c:(float)c d:(float)d {
    float t2 = t / d;
    return b + (-c * t2 * (t2 - 2));
}
@end


@implementation GLDEasingInOutQuad
- (float)t:(float)t b:(float)b c:(float)c d:(float)d {
    float t2 = t / d * 2;
    if (t2 < 1) {
        return c / 2 * t2 * t2 + b;
    }
    --t2;
    return - c / 2 * (t2 * (t2 - 2) - 1) + b;
}
@end


@implementation GLDEasingInCubic
- (float)t:(float)t b:(float)b c:(float)c d:(float)d {
    float t2 = t / d;
    return b + c * t2 * t2 * t2;
}
@end


@implementation GLDEasingOutCubic
- (float)t:(float)t b:(float)b c:(float)c d:(float)d {
    float t2 = t / d;
    --t2;
    return b + c * (t2 * t2 * t2 + 1);
}
@end


@implementation GLDEasingInOutCubic
- (float)t:(float)t b:(float)b c:(float)c d:(float)d {
    float t2 = t / d * 2;
    if (t2 < 1) {
        return c / 2 * t2 * t2 * t2 + b;
    }
    t2 -= 2;
    return b + c / 2 * (t2 * t2 * t2 + 2);
}
@end


@implementation GLDEasingInQuart
- (float)t:(float)t b:(float)b c:(float)c d:(float)d {
    float t2 = t / d;
    return b + c * t2 * t2 * t2 * t2;
}
@end


@implementation GLDEasingOutQuart
- (float)t:(float)t b:(float)b c:(float)c d:(float)d {
    float t2 = t / d;
    --t2;
    return b - c * (t2 * t2 * t2 * t2 - 1);
}
@end


@implementation GLDEasingInOutQuart
- (float)t:(float)t b:(float)b c:(float)c d:(float)d {
    float t2 = t / d * 2;
    if (t2 < 1) {
        return c / 2 * t2 * t2 * t2 * t2 + b;
    }
    t2 -= 2;
    return b - c / 2 * (t2 * t2 * t2 * t2 - 2);
}
@end


@implementation GLDEasingInQuint
- (float)t:(float)t b:(float)b c:(float)c d:(float)d {
    float t2 = t / d;
    return b + c * t2 * t2 * t2 * t2 * t2;
}
@end


@implementation GLDEasingOutQuint
- (float)t:(float)t b:(float)b c:(float)c d:(float)d {
    float t2 = t / d;
    --t2;
    return b + c * (t2 * t2 * t2 * t2 * t2 + 1);
}
@end


@implementation GLDEasingInOutQuint
- (float)t:(float)t b:(float)b c:(float)c d:(float)d {
    float t2 = t / d * 2;
    if (t2 < 1) {
        return c / 2 * t2 * t2 * t2 * t2 * t2 + b;
    }
    t2 -= 2;
    return b + c / 2 * (t2 * t2 * t2 * t2 * t2 + 2);
}
@end


@implementation GLDEasingInSine
- (float)t:(float)t b:(float)b c:(float)c d:(float)d {
    return -c * cos(t / d * (M_PI_2)) + c + b;
}
@end


@implementation GLDEasingOutSine
- (float)t:(float)t b:(float)b c:(float)c d:(float)d {
    return c * sin(t / d * (M_PI_2)) + b;
}
@end


@implementation GLDEasingInOutSine
- (float)t:(float)t b:(float)b c:(float)c d:(float)d {
    return -c / 2 * (cos(M_PI * t / d) - 1) + b;
}
@end


@implementation GLDEasingInExpo
- (float)t:(float)t b:(float)b c:(float)c d:(float)d {
    return c * pow(2, 10 * (t / d - 1)) + b;
}
@end


@implementation GLDEasingOutExpo
- (float)t:(float)t b:(float)b c:(float)c d:(float)d {
    return c * (-pow(2, -10 * t / d) + 1) + b;
}
@end


@implementation GLDEasingInOutExpo
- (float)t:(float)t b:(float)b c:(float)c d:(float)d {
    float t2 = t / d * 2;
    if (t2 < 1) {
        return c / 2 * pow(2, 10 * (t2 - 1)) + b;
    }
    t2--;
    return c / 2 * (-pow(2, -10 * t2) + 2) + b;
}
@end


@implementation GLDEasingInCirc
- (float)t:(float)t b:(float)b c:(float)c d:(float)d {
    float t2 = t / d;
    return -c * (sqrt(1 - t2 * t2) - 1) + b;
}
@end


@implementation GLDEasingOutCirc
- (float)t:(float)t b:(float)b c:(float)c d:(float)d {
    float t2 = t / d;
    --t2;
    return c * sqrt(1 - t2 * t2) + b;
}
@end


@implementation GLDEasingInOutCirc
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

@implementation GLDEasingInBack
- (float)t:(float)t b:(float)b c:(float)c d:(float)d {
    float s = 1.70158;
    t /= d;
    return c * t * t * ((s + 1) * t - s) + b;
}
@end


@implementation GLDEasingOutBack
- (float)t:(float)t b:(float)b c:(float)c d:(float)d {
    float s = 1.70158;
    t = t / d - 1;
    return c * (t * t * ((s + 1) * t + s) + 1) + b;
}
@end


@implementation GLDEasingInOutBack
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
@implementation GLDEasingInBounce
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


@implementation GLDEasingOutBounce
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
@implementation GLDEasingInOutBounce
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


@implementation GLDEasingInElastic
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


@implementation GLDEasingOutElastic
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


@implementation GLDEasingInOutElastic
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
