//
//  BSDAbs.m
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/15/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDAbs.h"

@implementation BSDAbs

- (void)setupWithArguments:(id)arguments
{
    self.name = @"absolute value";
}

-(id)calculateOutputValue
{
    double hot = [self.hotInlet.value doubleValue];
    double result = fabs(hot);
    return @(result);
}

@end
