//
//  BSDEqual.m
//  BSDLang
//
//  Created by Travis Henspeter on 7/13/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDEqual.h"

@implementation BSDEqual

- (void)setupWithArguments:(id)arguments
{
    self.name = @"equal";
}

-(id)calculateOutputValue
{
    double hot = [self.hotInlet.value doubleValue];
    double cold = [self.coldInlet.value doubleValue];
    NSInteger result = hot == cold;
    return @(result);
}

@end
