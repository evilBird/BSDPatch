//
//  BSDD2CHelper.m
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/19/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDIntersect2CirclesHelper.h"

@implementation BSDIntersect2CirclesHelper

- (void)setupWithArguments:(id)arguments
{
    self.name = @"2 circle intersect helper";
    
    self.circleRadius = self.hotInlet;
    self.cicleCenter = self.coldInlet;
    
    NSValue *coordinateValue = (NSValue *)arguments;
    if (coordinateValue && [coordinateValue isKindOfClass:[NSValue class]]) {
        self.coldInlet.value = coordinateValue;
    }
    
}

- (void)calculateOutput
{
    NSValue *coordinateValue = self.coldInlet.value;
    NSNumber *radius = self.hotInlet.value;
    if (coordinateValue && radius) {
        NSMutableDictionary *output = [NSMutableDictionary dictionary];
        output[@"center"] = coordinateValue;
        output[@"radius"] = radius;
        self.mainOutlet.value = output;
    }
}

@end
