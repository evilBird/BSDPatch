//
//  BSDReciprocal.m
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/19/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDReciprocal.h"
#import "BSDCreate.h"


@implementation BSDReciprocal

- (instancetype)initWithNumerator:(NSNumber *)numerator
{
    return [super initWithArguments:numerator];
}

- (void)setupWithArguments:(id)arguments
{
    self.name = @"reciprocal";
    NSNumber *numerator = arguments;
    if (numerator) {
        self.coldInlet.value = numerator;
    }else{
        self.coldInlet.value = @1;
    }
}

- (void)calculateOutput
{
    NSNumber *hot = self.hotInlet.value;
    NSNumber *cold = self.coldInlet.value;
    if (hot && cold) {
        self.mainOutlet.value = @(cold.doubleValue/hot.doubleValue);
    }
}

@end
