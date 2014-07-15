//
//  BSDDivide.m
//  BSDLang
//
//  Created by Travis Henspeter on 7/12/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDDivide.h"

@implementation BSDDivide

- (void)setupWithArguments:(id)arguments
{
    self.name = @"divide";
}

- (id)calculateOutputValue
{
    double result = [self.hotInlet.value doubleValue] / [self.coldInlet.value doubleValue];
    return @(result);
}

@end
