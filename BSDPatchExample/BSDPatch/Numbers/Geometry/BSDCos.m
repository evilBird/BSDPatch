//
//  BSDCos.m
//  BSDPatchExample
//
//  Created by Travis Henspeter on 8/5/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDCos.h"

@implementation BSDCos

- (void)setupWithArguments:(id)arguments
{
    self.name = @"cosine";
}

- (void)calculateOutput
{
    NSNumber *hot = self.hotInlet.value;
    self.mainOutlet.value = @(cos(hot.doubleValue));
}

@end
