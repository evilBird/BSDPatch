//
//  BSDArraySort.m
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/15/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDArraySort.h"

@implementation BSDArraySort

- (instancetype)initWithSortDescriptors:(NSArray *)sortDescriptors
{
    return [super initWithArguments:sortDescriptors];
}

- (void)setupWithArguments:(id)arguments
{
    self.name = @"sort";
    NSArray *sortDescriptors = arguments;
    if (sortDescriptors) {
        self.coldInlet.value = sortDescriptors;
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
