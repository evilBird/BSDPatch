//
//  BSDLog.m
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/14/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDLog.h"

@implementation BSDLog

-(id)calculateOutputValue
{
    double hot = [[self hotInletValue]doubleValue];
    double result = log(hot);
    return @(result);
}

@end
