//
//  BSDLess.m
//  BSDLang
//
//  Created by Travis Henspeter on 7/13/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDLess.h"

@implementation BSDLess

- (void)setupWithArguments:(id)arguments
{
    self.name = @"less than";
}

- (void)calculateOutput
{
    self.mainOutlet.value = @([self.hotInlet.value doubleValue] < [self.coldInlet.value doubleValue]);
}

@end
