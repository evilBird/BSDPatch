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

-(id)calculateOutputValue
{
    double hot = [self.hotInlet.value doubleValue];
    double cold = [self.coldInlet.value doubleValue];
    double result = pow(hot, cold);
    return @(result);
}


@end
