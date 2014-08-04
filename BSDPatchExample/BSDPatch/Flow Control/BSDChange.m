//
//  BSDChange.m
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/15/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDChange.h"

@implementation BSDChange

- (instancetype)initWithComparisonValue:(id)value
{
    return [super initWithArguments:value];
}

- (void)setupWithArguments:(id)arguments
{
    self.name = @"change";
    id comparisonValue = arguments;
    if (comparisonValue) {
        self.coldInlet.value = comparisonValue;
    }
}

- (void)calculateOutput
{
    if (![self.hotInlet.value isEqual:self.coldInlet.value]) {
        self.coldInlet.value = self.hotInlet.value;
        self.mainOutlet.value = self.hotInlet.value;
    }
}

@end
