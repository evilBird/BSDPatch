//
//  BSDArrayBox.m
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/18/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDArrayBox.h"

@implementation BSDArrayBox

- (void)setupWithArguments:(id)arguments
{
    self.name = @"array box";
    if (arguments && [arguments isKindOfClass:[NSArray class]]) {
        [self.coldInlet input:arguments];
    }
}

- (void)calculateOutput
{
    id hot = self.hotInlet.value;
    NSArray *array = self.coldInlet.value;
    if ([self isBang:hot] && array) {
        self.mainOutlet.value = array;
    }
}

- (void)reset
{
    self.coldInlet.value = NULL;
}

@end
