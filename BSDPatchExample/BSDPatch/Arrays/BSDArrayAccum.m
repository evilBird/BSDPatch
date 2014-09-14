//
//  BSDArrayAccum.m
//  BSDPatchExample
//
//  Created by Travis Henspeter on 8/5/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDArrayAccum.h"

@implementation BSDArrayAccum

- (instancetype)initWithMaxLength:(NSNumber *)maxLength
{
    return [super initWithArguments:maxLength];
}

- (void)setupWithArguments:(id)arguments
{
    self.name = @"array accumulate";
    NSNumber *maxLength = arguments;
    self.accumulated = [[NSMutableArray alloc]init];
    if (maxLength) {
        self.coldInlet.value = maxLength;
    }else{
        self.coldInlet.value = @(1);
    }
}

- (void)calculateOutput
{
    id hot = self.hotInlet.value;
    if (hot != NULL) {
        [self.accumulated addObject:hot];
    }
    NSNumber *cold = self.coldInlet.value;
    if (self.accumulated.count >= cold.integerValue) {
        self.mainOutlet.value = self.accumulated.mutableCopy;
        [self.accumulated removeAllObjects];
    }
}

@end
