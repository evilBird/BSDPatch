//
//  BSDMod.m
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/18/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDMod.h"

@implementation BSDMod

- (instancetype)initWithModulo:(NSNumber *)modulo
{
    return [super initWithArguments:modulo];
}

- (void)setupWithArguments:(id)arguments
{
    self.name = @"modulus";
    
    NSNumber *initVal = (NSNumber *)arguments;
    if (initVal) {
        [self.coldInlet input:initVal];
    }else{
        [self.coldInlet input:@(0)];
    }
}

- (void)calculateOutput
{
    int val = (int)[self.hotInlet.value integerValue];
    int mod = (int)[self.coldInlet.value integerValue];
    int result = val%mod;
    self.mainOutlet.value = @(result);
}

@end
