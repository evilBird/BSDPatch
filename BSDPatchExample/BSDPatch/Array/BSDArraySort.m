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
        [self.coldInlet input:args];
    }else{
        [self.coldInlet input:@[args]];
    }
}

- (void)calculateOutput
{
    NSMutableArray *inputCopy = [self.hotInlet.value mutableCopy];
    NSArray *args = self.coldInlet.value;
    [inputCopy sortUsingDescriptors:args];
    self.mainOutlet.value = inputCopy;
}


@end
