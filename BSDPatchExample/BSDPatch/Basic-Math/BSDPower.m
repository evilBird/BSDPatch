//
//  BSDPower.m
//  BSDLang
//
//  Created by Travis Henspeter on 7/13/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDPower.h"

@implementation BSDPower

- (void)setupWithArguments:(id)arguments
{
    self.name = @"multiply";
}

- (void)calculateOutput
{
    self.mainOutlet.value = @(pow([self.hotInlet.value doubleValue], [self.coldInlet.value doubleValue]));
}


@end
