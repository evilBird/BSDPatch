//
//  BSDTan.m
//  BSDPatchExample
//
//  Created by Travis Henspeter on 8/5/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDTan.h"

@implementation BSDTan

- (void)setupWithArguments:(id)arguments
{
    self.name = @"tangent";
}

- (void)calculateOutput
{
    NSNumber *hot = self.hotInlet.value;
    self.mainOutlet.value = @(tan(hot.doubleValue));
}

@end
