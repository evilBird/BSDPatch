//
//  BSDArraySort.m
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/15/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDArraySort.h"

@implementation BSDArraySort

- (void)setupWithArguments:(id)arguments
{
    self.name = @"sort";
    NSArray *args = (NSArray *)arguments;
    if ([args respondsToSelector:@selector(count)]) {
        [self cold:args];
    }else{
        [self cold:@[args]];
    }
}

- (id)calculateOutputValue
{
    NSMutableArray *inputCopy = [self.hotInlet.value mutableCopy];
    NSArray *args = self.coldInlet.value;
    [inputCopy sortUsingDescriptors:args];
    return inputCopy;
}

@end
