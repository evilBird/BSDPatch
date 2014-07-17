//
//  BSDChange.m
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/15/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDChange.h"

@implementation BSDChange

- (void)setupWithArguments:(id)arguments
{
    self.name = @"change";
    [self.coldInlet input:@(0)];
}

- (void)calculateOutput
{
    if (self.hotInlet.value != self.coldInlet.value) {
        self.coldInlet.value = self.hotInlet.value;
        self.mainOutlet.value = self.hotInlet.value;
    }
}

@end
