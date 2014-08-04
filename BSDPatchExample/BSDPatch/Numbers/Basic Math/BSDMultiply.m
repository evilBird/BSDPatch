//
//  BSDMultiply.m
//  BSDLang
//
//  Created by Travis Henspeter on 7/12/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDMultiply.h"

@implementation BSDMultiply

- (instancetype)initWithWithFactor:(NSNumber *)factor
{
    return [super initWithArguments:factor];
}

- (void)setupWithArguments:(id)arguments
{
    self.name = @"multiply";
    NSNumber *initFactor = arguments;
    if (initFactor) {
        self.coldInlet.value = initFactor;
    }else{
        self.coldInlet.value = @0;
    }
}

- (void)calculateOutput
{
    self.mainOutlet.value = @([self.hotInlet.value doubleValue] * [self.coldInlet.value doubleValue]);
}


@end
