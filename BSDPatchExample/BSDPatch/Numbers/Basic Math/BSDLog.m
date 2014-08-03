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

- (void)calculateOutput
{
    self.mainOutlet.value = @(log([self.hotInlet.value doubleValue]));
}

@end
