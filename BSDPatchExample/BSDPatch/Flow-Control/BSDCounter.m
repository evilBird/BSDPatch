//
//  BSDCounter.m
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/14/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDCounter.h"

@implementation BSDCounter

- (void)setupWithArguments:(NSArray *)arguments
{
    self.name = @"counter";
    [self.coldInlet input:@(0)];
    self.stepSizeInlet = [[BSDInlet alloc]initCold];
    self.stepSizeInlet.name = @"step";
    [self addPort:self.stepSizeInlet];
    [self.stepSizeInlet input:@(1)];

    if (arguments.count > 0) {
        NSNumber *initVal = arguments[0];
        [self.coldInlet input:initVal];
    }
    
    if (arguments.count > 1) {
        NSNumber *stepSize = arguments[1];
        [self.stepSizeInlet input:stepSize];
    }
}

- (void)reset
{
    [self.coldInlet input:@(0)];    
}

- (void)calculateOutput
{
    double cold = [self.coldInlet.value doubleValue];
    double step = [self.stepSizeInlet.value doubleValue];
    double result = cold+step;
    self.coldInlet.value = @(result);
    self.mainOutlet.value = @(result);
}

@end
