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
    //cold inlet takes a coordinate wrapped in an instance of NSValue
    NSValue *coordinateValue = (NSValue *)arguments;
    if (coordinateValue && [coordinateValue isKindOfClass:[NSValue class]]) {
        self.coldInlet.value = coordinateValue;
    }
    
}

- (void)calculateOutput
{
    //hot inlet takes the observed distance (circle radius) and a coordinate and packages it for use by a d2c object
    NSValue *coordinateValue = self.coldInlet.value;
    NSNumber *radius = self.hotInlet.value;
    if (coordinateValue && radius) {
        CGPoint coordinate = [coordinateValue CGPointValue];
        NSMutableDictionary *output = [NSMutableDictionary dictionary];
        output[@"x"] = @(coordinate.x);
        output[@"y"] = @(coordinate.y);
        output[@"r"] = radius;
        self.mainOutlet.value = output;
    }
}

@end
