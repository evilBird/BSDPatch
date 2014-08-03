//
//  BSDMultiply.m
//  BSDLang
//
//  Created by Travis Henspeter on 7/12/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDMultiply.h"

@implementation BSDMultiply

- (void)setupWithArguments:(id)arguments
{
    self.name = @"multiply";
    if (arguments) {
        self.coldInlet.value = arguments;
    }
}

- (void)calculateOutput
{
    self.mainOutlet.value = @([self.hotInlet.value doubleValue] * [self.coldInlet.value doubleValue]);
}


@end
