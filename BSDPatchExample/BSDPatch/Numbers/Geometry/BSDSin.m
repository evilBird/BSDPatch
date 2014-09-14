//
//  BSDSin.m
//  BSDPatchExample
//
//  Created by Travis Henspeter on 8/5/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDSin.h"

@implementation BSDSin

- (void)setupWithArguments:(id)arguments
{
    self.name = @"sine";
}

- (void)calculateOutput
{
    NSNumber *hot = self.hotInlet.value;
    self.mainOutlet.value = @(sin(hot.doubleValue));
}

@end
