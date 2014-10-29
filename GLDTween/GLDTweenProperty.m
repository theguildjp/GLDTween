//
//  GLDTweenProperty.m
//  GLDTween
//
//  Created by Takayuki Fukatsu on 2014/10/01.
//  Copyright (c) 2014 THE GUILD. All rights reserved.
//

#import "GLDTweenProperty.h"


@implementation GLDTweenProperty


- (void)setValue:(id)value forTarget:(NSObject*)target key:(NSString *)key{
    [target setValue:value forKey:key];
}


- (id)valueForTarget:(NSObject*)target key:(NSString*)key{
    return [target valueForKey:key];
}


- (void)setStartValueForTarget:(NSObject*)target key:(NSString*)key{
    [target setValue:self.startValue forKey:key];
}


- (void)setTweenValueForTarget:(NSObject*)target key:(NSString*)key time:(float)t duration:(float)d ease:(GLDEasing*)ease{
}


- (void)setCompleteValueForTarget:(NSObject*)target key:(NSString*)key{
    [self setValue:self.completeValue forTarget:target key:key];
}


- (void)updateStartValueForTarget:(NSObject *)target key:(NSString *)key{
    self.startValue = [self valueForTarget:target key:key];
}


@end


//Property wrapper for Number
@implementation GLDTweenPropertyCGFloat


- (NSString*)type{
    return @"CGFloat";
}


- (void)setTweenValueForTarget:(NSObject*)target key:(NSString*)key time:(float)t duration:(float)d ease:(GLDEasing*)ease{
    float b = ((NSNumber*)self.startValue).floatValue;
    float c = ((NSNumber*)self.completeValue).floatValue - b;
    float val = [ease t:t b:b c:c d:d];
    [self setValue:[NSNumber numberWithFloat:val] forTarget:target key:key];
}


@end


//Property wrapper for CGPoint
@implementation GLDTweenPropertyCGPoint


- (NSString*)type{
    return @"CGPoint";
}


- (void)setTweenValueForTarget:(NSObject*)target key:(NSString*)key time:(float)t duration:(float)d ease:(GLDEasing*)ease{
    CGPoint spt = self.startValue.CGPointValue;
    CGPoint cpt = self.completeValue.CGPointValue;
    CGPoint destPt = CGPointMake([ease t:t b:spt.x c:cpt.x - spt.x d:d],
                                 [ease t:t b:spt.y c:cpt.y - spt.y d:d]);
    [self setValue:[NSValue valueWithCGPoint:destPt] forTarget:target key:key];
}


@end


//Property wrapper for CGSize
@implementation GLDTweenPropertyCGSize


- (NSString*)type{
    return @"CGSize";
}


- (void)setTweenValueForTarget:(NSObject*)target key:(NSString*)key time:(float)t duration:(float)d ease:(GLDEasing*)ease{
    CGPoint ssz = self.startValue.CGPointValue;
    CGPoint csz = self.completeValue.CGPointValue;
    CGSize destSz = CGSizeMake([ease t:t b:ssz.x c:csz.x - ssz.x d:d],
                               [ease t:t b:ssz.y c:csz.y - ssz.y d:d]);
    [self setValue:[NSValue valueWithCGSize:destSz] forTarget:target key:key];
}


@end


//Property wrapper for CGRect
@implementation GLDTweenPropertyCGRect


- (NSString*)type{
    return @"CGRect";
}


- (void)setTweenValueForTarget:(NSObject*)target key:(NSString*)key time:(float)t duration:(float)d ease:(GLDEasing*)ease{
    CGRect src = self.startValue.CGRectValue;
    CGRect crc = self.completeValue.CGRectValue;
    CGRect destRc = CGRectMake([ease t:t b:src.origin.x c:crc.origin.x - src.origin.x d:d],
                               [ease t:t b:src.origin.y c:crc.origin.y - src.origin.y d:d],
                               [ease t:t b:src.size.width c:crc.size.width - src.size.width d:d],
                               [ease t:t b:src.size.height c:crc.size.height - src.size.height d:d]);
    [self setValue:[NSValue valueWithCGRect:destRc] forTarget:target key:key];
}


@end


//Property wrapper for CGRect
@implementation GLDTweenPropertyCGAffineTransform


- (NSString*)type{
    return @"CGAffineTransform";
}


- (void)setTweenValueForTarget:(NSObject*)target key:(NSString*)key time:(float)t duration:(float)d ease:(GLDEasing*)ease{
    CGAffineTransform sat = self.startValue.CGAffineTransformValue;
    CGAffineTransform cat = self.completeValue.CGAffineTransformValue;
    CGAffineTransform destAt = CGAffineTransformMake([ease t:t b:sat.a c:cat.a - sat.a d:d],
                                                     [ease t:t b:sat.b c:cat.b - sat.b d:d],
                                                     [ease t:t b:sat.c c:cat.c - sat.c d:d],
                                                     [ease t:t b:sat.d c:cat.d - sat.d d:d],
                                                     [ease t:t b:sat.tx c:cat.tx - sat.tx d:d],
                                                     [ease t:t b:sat.ty c:cat.ty - sat.ty d:d]);
    [self setValue:[NSValue valueWithCGAffineTransform:destAt] forTarget:target key:key];
}


@end


//Property wrapper for CGRect
@implementation GLDTweenPropertyCATransform3D


- (NSString*)type{
    return @"CATransform3D";
}


- (void)setTweenValueForTarget:(NSObject*)target key:(NSString*)key time:(float)t duration:(float)d ease:(GLDEasing*)ease{
    CATransform3D st3 = self.startValue.CATransform3DValue;
    CATransform3D ct3 = self.completeValue.CATransform3DValue;
    
    CATransform3D destT3 = CATransform3DIdentity;
    destT3.m11 = [ease t:t b:st3.m11 c:ct3.m11 - st3.m11 d:d];
    destT3.m12 = [ease t:t b:st3.m12 c:ct3.m12 - st3.m12 d:d];
    destT3.m13 = [ease t:t b:st3.m13 c:ct3.m13 - st3.m13 d:d];
    destT3.m14 = [ease t:t b:st3.m14 c:ct3.m14 - st3.m14 d:d];
    destT3.m21 = [ease t:t b:st3.m21 c:ct3.m21 - st3.m21 d:d];
    destT3.m22 = [ease t:t b:st3.m22 c:ct3.m22 - st3.m22 d:d];
    destT3.m23 = [ease t:t b:st3.m23 c:ct3.m23 - st3.m23 d:d];
    destT3.m24 = [ease t:t b:st3.m24 c:ct3.m24 - st3.m24 d:d];
    destT3.m31 = [ease t:t b:st3.m31 c:ct3.m31 - st3.m31 d:d];
    destT3.m32 = [ease t:t b:st3.m32 c:ct3.m32 - st3.m32 d:d];
    destT3.m33 = [ease t:t b:st3.m33 c:ct3.m33 - st3.m33 d:d];
    destT3.m34 = [ease t:t b:st3.m34 c:ct3.m34 - st3.m34 d:d];
    destT3.m41 = [ease t:t b:st3.m41 c:ct3.m41 - st3.m41 d:d];
    destT3.m42 = [ease t:t b:st3.m42 c:ct3.m42 - st3.m42 d:d];
    destT3.m43 = [ease t:t b:st3.m43 c:ct3.m43 - st3.m43 d:d];
    destT3.m44 = [ease t:t b:st3.m44 c:ct3.m44 - st3.m44 d:d];
 
    [self setValue:[NSValue valueWithCATransform3D:destT3] forTarget:target key:key];
}


@end
