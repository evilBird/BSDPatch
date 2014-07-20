//
//  BSDPoint.m
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/19/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDPoint.h"
#import "BSDCreate.h"

@implementation BSDPoint

- (instancetype)initWithCGPoint:(CGPoint)point
{
    return [super initWithArguments:[NSValue wrapPoint:point]];
}

@end
