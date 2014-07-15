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
    [self setColdInletValue:@(0)];
}

- (id)calculateOutputValue
{
    double hot = [[self hotInletValue]doubleValue];
    double cold = [[self coldInletValue]doubleValue];
    double result = cold+hot;
    [self setColdInletValue:@(result)];
    return @(result);
}

- (void)reset
{
    [self setColdInletValue:@(0)];
}

@end
