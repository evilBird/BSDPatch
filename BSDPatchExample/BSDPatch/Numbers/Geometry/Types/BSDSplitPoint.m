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

- (instancetype)initWithCGPoint:(CGPoint)point
{
    return [super initWithArguments:[NSValue wrapPoint:point]];
}

- (void)setupWithArguments:(id)arguments
{
    self.name = @"split point";
    self.x = [[BSDOutlet alloc]init];
    self.x.name = @"x";
    self.x.value = @0;
    self.y = [[BSDOutlet alloc]init];
    self.y.name = @"y";
    self.y.value = @0;
    [self addPort:self.x];
    [self addPort:self.y];
    
    NSValue *initialPoint = arguments;
    if (initialPoint) {
        self.coldInlet.value = initialPoint;
    }
}

- (void)inletReceievedBang:(BSDInlet *)inlet
{
    if (inlet == self.hotInlet) {
        [self calculateOutput];
    }
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
