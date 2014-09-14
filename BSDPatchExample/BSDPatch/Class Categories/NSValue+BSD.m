//
//  NSValue+BSD.m
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/19/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "NSValue+BSD.h"

@implementation NSValue (BSD)

+ (NSValue *)wrapPoint:(CGPoint)point
{
    return [NSValue valueWithCGPoint:point];
}

+ (NSValue *)wrapRect:(CGRect)rect
{
    return [NSValue valueWithCGRect:rect];
}

+ (NSValue *)wrap3DTransform:(CATransform3D)transform
{
    return [NSValue valueWithCATransform3D:transform];
}

+ (NSValue *)wrapAffineTransform:(CGAffineTransform)transform
{
    return [NSValue valueWithCGAffineTransform:transform];
}

+ (NSDictionary *) wrapAccel:(CMAcceleration) accel
{
    return @{@"x": @(accel.x),
             @"y":@(accel.y),
             @"z":@(accel.z)};
    
}

@end
