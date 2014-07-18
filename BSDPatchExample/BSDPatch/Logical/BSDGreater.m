//
//  BSDGreater.m
//  BSDLang
//
//  Created by Travis Henspeter on 7/13/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDGreater.h"

@implementation BSDGreater

- (void)setupWithArguments:(id)arguments
{
    self.name = @"greater than";
    NSNumber *initVal = (NSNumber *)arguments;
    if (initVal) {
        [self.coldInlet input:initVal];
    }
}

- (void)calculateOutput
{
    self.mainOutlet.value = @([self.hotInlet.value doubleValue] > [self.coldInlet.value doubleValue]);
}

@end
