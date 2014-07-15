//
//  BSDLog.m
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/14/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDLog.h"

@implementation BSDLog

- (void)setupWithArguments:(id)arguments
{
    self.name = @"natural log";
}

-(id)calculateOutputValue
{
    double hot = [self.hotInlet.value doubleValue];
    double result = log(hot);
    return @(result);
}

@end
