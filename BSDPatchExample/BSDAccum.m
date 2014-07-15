//
//  BSDAccum.m
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/14/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDAccum.h"

@implementation BSDAccum

- (void)setupWithArguments:(NSArray *)arguments
{
    self.name = @"accum";
    [self setColdInletValue:@(0)];
}

- (id)calculateOutputValue
{
    double hot = [self.hotInlet.value doubleValue];
    double cold = [self.coldInlet.value doubleValue];
    double result = cold+hot;
    [self setColdInletValue:@(result)];
    return @(result);
}

- (void)reset
{
    [self setColdInletValue:@(0)];
}

@end
