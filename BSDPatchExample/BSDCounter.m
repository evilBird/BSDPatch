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
    [self setColdInletValue:@(0)];
}

- (id)calculateOutputValue
{
    double cold = [[self coldInletValue]doubleValue];
    double result = cold+1;
    [self setColdInletValue:@(result)];
    return @(result);
}

- (void)reset
{
    [self setColdInletValue:@(0)];
}

@end
