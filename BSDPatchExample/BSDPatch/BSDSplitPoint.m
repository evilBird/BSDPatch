//
//  BSDPointSplit.m
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/20/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDSplitPoint.h"
#import "BSDCreate.h"

@implementation BSDSplitPoint

- (void)setupWithArguments:(id)arguments
{
    self.name = @"split point";
    self.x = [[BSDOutlet alloc]init];
    self.x.name = @"x";
    self.y = [[BSDOutlet alloc]init];
    self.y.name = @"y";
    [self addPort:self.x];
    [self addPort:self.y];
    
}

- (void)calculateOutput
{
    NSValue *point = self.hotInlet.value;
    if (point) {
        CGPoint pt = point.CGPointValue;
        self.y.value = @(pt.y);
        self.x.value = @(pt.x);
    }
}

@end
