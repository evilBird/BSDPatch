//
//  BSDSubtract.m
//  BSDLang
//
//  Created by Travis Henspeter on 7/12/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDSubtract.h"

@implementation BSDSubtract

- (void)setupWithArguments:(id)arguments
{
    self.name = @"subtract";
}

- (id)calculateOutputValue
{
    double result = [self.hotInlet.value doubleValue] - [self.coldInlet.value doubleValue];
    return @(result);
}

@end
