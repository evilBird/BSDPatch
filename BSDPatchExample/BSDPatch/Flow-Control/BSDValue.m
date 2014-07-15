//
//  BSDValue.m
//  BSDLang
//
//  Created by Travis Henspeter on 7/13/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDValue.h"

@implementation BSDValue

- (void)setupWithArguments:(id)arguments
{
    self.name = @"value";
}

- (id)calculateOutputValue
{
    return [self coldInletValue];
}

@end
