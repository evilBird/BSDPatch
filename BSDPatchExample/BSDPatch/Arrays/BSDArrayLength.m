//
//  BSDArrayLength.m
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/20/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDArrayLength.h"

@implementation BSDArrayLength

- (void)setupWithArguments:(id)arguments
{
    self.name = @"array length";
}

- (void)calculateOutput
{
    NSArray *hot = self.hotInlet.value;
    if (hot) {
        self.mainOutlet.value = @(hot.count);
    }
}

@end
