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

-(id)calculateOutputValue
{
    double hot = [self.hotInlet.value doubleValue];
    double cold = [self.coldInlet.value doubleValue];
    double result = hot < cold;
    return @(result);
}

@end
