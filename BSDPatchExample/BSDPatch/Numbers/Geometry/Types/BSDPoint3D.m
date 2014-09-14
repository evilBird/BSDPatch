//
//  BSDPoint3D.m
//  BSDPatchExample
//
//  Created by Travis Henspeter on 8/4/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDPoint3D.h"
#import "BSDCreate.h"

@implementation BSDPoint3D

- (instancetype)initWith3DPoint:(BSD3DPoint)point
{
    return [super initWithArguments:nil];
}

- (void)setupWithArguments:(id)arguments
{
        self.xInlet = [[BSDInlet alloc]initHot];
        self.xInlet.name = @"x";
        self.xInlet.value = @0;
        self.yInlet = [[BSDInlet alloc]initHot];
        self.yInlet.name = @"y";
        self.yInlet.value = @0;
        self.zInlet = [[BSDInlet alloc]initHot];
        self.zInlet.name = @"z";
        self.zInlet.value = @0;
        [self addPort:self.xInlet];
        [self addPort:self.yInlet];
        [self addPort:self.zInlet];
        
        NSDictionary *initVal = arguments;
        if (initVal) {
            self.xInlet.value = initVal[@"x"];
            self.yInlet.value = initVal[@"y"];
            self.zInlet.value = initVal[@"z"];
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
    NSNumber *x = self.xInlet.value;
    NSNumber *y = self.yInlet.value;
    NSNumber *z = self.zInlet.value;
    
    if (x && y) {
        CGPoint output;
        output.x = x.doubleValue;
        output.y = y.doubleValue;
        
        self.mainOutlet.value = [NSValue wrapPoint:output];
    }
}

@end
