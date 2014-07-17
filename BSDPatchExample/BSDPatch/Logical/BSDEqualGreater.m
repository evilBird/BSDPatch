//
//  BSDEqualGreater.m
//  BSDLang
//
//  Created by Travis Henspeter on 7/13/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDEqualGreater.h"

@implementation BSDEqualGreater

- (void)setupWithArguments:(id)arguments
{
    self.name = @"equal or greater";
}

- (void)calculateOutput
{
    self.mainOutlet.value = @([self.hotInlet.value doubleValue] >= [self.coldInlet.value doubleValue]);
}

@end
