//
//  GLDTweenPropertyPlugin.m
//  GLDTween
//
//  Created by Takayuki Fukatsu on 2014/10/01.
//  Copyright (c) 2014 THE GUILD. All rights reserved.
//

#import "GLDTweenPropertyPlugin.h"


@implementation GLDTweenPropertyX
- (void)setValue:(NSValue *)value forTarget:(NSObject *)target key:(NSString *)key {
    if ([target isKindOfClass:[UIView class]] && [value isKindOfClass:[NSNumber class]]) {
        UIView *view = (UIView *)target;
        CGRect rect = view.frame;
        rect.origin = CGPointMake(((NSNumber *)value).floatValue, view.frame.origin.y);
        view.frame = rect;
    } else {
        [super setValue:value forTarget:target key:key];
    }
}

- (id)valueForTarget:(NSObject *)target key:(NSString *)key {
    if ([target isKindOfClass:[UIView class]]) {
        return [NSNumber numberWithFloat:((UIView *)target).frame.origin.x];
    }
    return [super valueForTarget:target key:key];
}
@end


@implementation GLDTweenPropertyY
- (void)setValue:(NSValue *)value forTarget:(NSObject *)target key:(NSString *)key {
    if ([target isKindOfClass:[UIView class]] && [value isKindOfClass:[NSNumber class]]) {
        UIView *view = (UIView *)target;
        CGRect rect = view.frame;
        rect.origin = CGPointMake(view.frame.origin.x, ((NSNumber *)value).floatValue);
        view.frame = rect;
    } else {
        [super setValue:value forTarget:target key:key];
    }
}

- (id)valueForTarget:(NSObject *)target key:(NSString *)key {
    if ([target isKindOfClass:[UIView class]]) {
        return [NSNumber numberWithFloat:((UIView *)target).frame.origin.x];
    }
    return [super valueForTarget:target key:key];
}
@end


@implementation GLDTweenPropertyWidth
- (void)setValue:(NSValue *)value forTarget:(NSObject *)target key:(NSString *)key {
    if ([target isKindOfClass:[UIView class]] && [value isKindOfClass:[NSNumber class]]) {
        UIView *view = (UIView *)target;
        CGRect rect = view.frame;
        rect.size = CGSizeMake(((NSNumber *)value).floatValue, view.frame.size.height);
        view.frame = rect;
    } else {
        [super setValue:value forTarget:target key:key];
    }
}

- (id)valueForTarget:(NSObject *)target key:(NSString *)key {
    if ([target isKindOfClass:[UIView class]]) {
        return [NSNumber numberWithFloat:((UIView *)target).frame.size.width];
    }
    return [super valueForTarget:target key:key];
}
@end


@implementation GLDTweenPropertyHeight
- (void)setValue:(NSValue *)value forTarget:(NSObject *)target key:(NSString *)key {
    if ([target isKindOfClass:[UIView class]] && [value isKindOfClass:[NSNumber class]]) {
        UIView *view = (UIView *)target;
        CGRect rect = view.frame;
        rect.size = CGSizeMake(view.frame.size.width, ((NSNumber *)value).floatValue);
        view.frame = rect;
    } else {
        [super setValue:value forTarget:target key:key];
    }
}

- (id)valueForTarget:(NSObject *)target key:(NSString *)key {
    if ([target isKindOfClass:[UIView class]]) {
        return [NSNumber numberWithFloat:((UIView *)target).frame.size.height];
    }
    return [super valueForTarget:target key:key];
}
@end


/**
 Property Proxy for UIView.center.x
 */
@implementation GLDTweenPropertyCenterX
- (void)setValue:(NSValue *)value forTarget:(NSObject *)target key:(NSString *)key {
    if ([target isKindOfClass:[UIView class]] && [value isKindOfClass:[NSNumber class]]) {
        UIView *view = (UIView *)target;
        CGPoint pt = view.center;
        pt.x = ((NSNumber *)value).floatValue;
        view.center = pt;
    } else {
        [super setValue:value forTarget:target key:key];
    }
}

- (id)valueForTarget:(NSObject *)target key:(NSString *)key {
    if ([target isKindOfClass:[UIView class]]) {
        return [NSNumber numberWithFloat:((UIView *)target).center.x];
    }
    return [super valueForTarget:target key:key];
}
@end


/**
 Property Proxy for UIView.center.y
 */
@implementation GLDTweenPropertyCenterY
- (void)setValue:(NSValue *)value forTarget:(NSObject *)target key:(NSString *)key {
    if ([target isKindOfClass:[UIView class]] && [value isKindOfClass:[NSNumber class]]) {
        UIView *view = (UIView *)target;
        CGPoint pt = view.center;
        pt.y = ((NSNumber *)value).floatValue;
        view.center = pt;
    } else {
        [super setValue:value forTarget:target key:key];
    }
}

- (id)valueForTarget:(NSObject *)target key:(NSString *)key {
    if ([target isKindOfClass:[UIView class]]) {
        return [NSNumber numberWithFloat:((UIView *)target).center.y];
    }
    return [super valueForTarget:target key:key];
}
@end


/**
 Property Proxy for UIView.layer.transform3D
 */
@implementation GLDTweenPropertyTransform3D
- (void)setValue:(NSValue *)value forTarget:(NSObject *)target key:(NSString *)key {
    if ([target isKindOfClass:[UIView class]]) {
        ((UIView *)target).layer.transform = [value CATransform3DValue];
    } else {
        [super setValue:value forTarget:target key:key];
    }
}

- (id)valueForTarget:(NSObject *)target key:(NSString *)key {
    if ([target isKindOfClass:[UIView class]]) {
        return [NSValue valueWithCATransform3D:((UIView *)target).layer.transform];
    }
    return [super valueForTarget:target key:key];
}
@end
