//
//  BSDMax.m
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/18/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDMax.h"

@implementation BSDMax

- (void)setupWithArguments:(id)arguments
{
    self.name = @"max";
    NSNumber *initVal = (NSNumber *)arguments;
    if (initVal) {
        [self.coldInlet input:initVal];
    }else{
        [self.coldInlet input:@(0)];
    }
}

- (void)calculateOutput
{
    double cold = [self.coldInlet.value doubleValue];
    double hot = [self.hotInlet.value doubleValue];
    double result = cold;
    if (hot > cold) {
        result = hot;
    }
    
    self.mainOutlet.value = @(result);
}

@end
