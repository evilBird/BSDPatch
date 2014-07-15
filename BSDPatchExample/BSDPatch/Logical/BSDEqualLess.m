//
//  BSDEqualLess.m
//  BSDLang
//
//  Created by Travis Henspeter on 7/13/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDEqualLess.h"

@implementation BSDEqualLess

- (void)setupWithArguments:(id)arguments
{
    self.name = @"equal or less than";
}

-(id)calculateOutputValue
{
    double hot = [[self hotInletValue]doubleValue];
    double cold = [[self coldInletValue]doubleValue];
    NSInteger result = hot <= cold;
    return @(result);
}

@end
