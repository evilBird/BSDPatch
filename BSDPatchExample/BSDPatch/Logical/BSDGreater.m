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
}

- (void)calculateOutput
{
    self.mainOutlet.value = @([self.hotInlet.value doubleValue] > [self.coldInlet.value doubleValue]);
}

@end
