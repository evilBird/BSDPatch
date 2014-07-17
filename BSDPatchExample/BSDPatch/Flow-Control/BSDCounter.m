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
    self.coldInlet.value = @(0);
}

- (void)reset
{
    self.coldInlet.value = @(0);
}

- (void)calculateOutput
{
    double cold = [self.coldInlet.value doubleValue];
    double result = cold+1;
    self.mainOutlet.value = @(result);
    self.coldInlet.value = @(result);
}

@end
