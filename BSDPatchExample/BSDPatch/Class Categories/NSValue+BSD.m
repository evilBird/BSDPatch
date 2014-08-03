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

@end
