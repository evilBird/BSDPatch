//
//  BSDEqual.m
//  BSDLang
//
//  Created by Travis Henspeter on 7/13/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDEqual.h"

@implementation BSDEqual

- (void)setupWithArguments:(id)arguments
{
    self.name = @"equal";
    NSNumber *initVal = (NSNumber *)arguments;
    if (initVal) {
        [self.coldInlet input:initVal];
    }
}

- (void)calculateOutput
{
    self.mainOutlet.value = @([self.hotInlet.value doubleValue] == [self.coldInlet.value doubleValue]);
}

@end
