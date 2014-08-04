//
//  BSDArraySplit.m
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/20/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDSplitArray.h"

@implementation BSDSplitArray

- (instancetype)initWithSplitIndex:(NSNumber *)splitIndex
{
    return [super initWithArguments:splitIndex];
}

- (instancetype)initWithArray:(NSArray *)array
{
    return [super initWithArguments:array];
}

- (void)setupWithArguments:(id)arguments
{
    self.name = @"split array";
    self.remainderOutlet = [[BSDOutlet alloc]init];
    self.remainderOutlet.name = @"right";
    [self addPort:self.remainderOutlet];
    
    NSArray *splitIndex = arguments;
    if (splitIndex) {
        self.coldInlet.value = splitIndex;
    }else{
        self.coldInlet.value = @0;
    }
}

- (void)calculateOutput
{
    NSNumber *hot = self.hotInlet.value;
    NSUInteger i = hot.integerValue;
    NSArray *array = self.coldInlet.value;
    
    if (array && i>0 && i<array.count + 1) {
        NSRange leftRange;
        leftRange.location = 0;
        leftRange.length = i;
        NSRange rightRange;
        rightRange.location = i;
        rightRange.length = array.count - i;
        self.remainderOutlet.value = [array objectsAtIndexes:[NSIndexSet indexSetWithIndexesInRange:rightRange]];
        self.mainOutlet.value = [array objectsAtIndexes:[NSIndexSet indexSetWithIndexesInRange:leftRange]];
    }
}

- (void)test
{
    self.coldInlet.value = @[@(1),@(2),@(3),@(4),@(5)];
    self.hotInlet.value = @(3);
    self.hotInlet.value = @(4);
    self.hotInlet.value = @(5);
    self.hotInlet.value = @(0);
    self.hotInlet.value = @(-2);
}

@end
