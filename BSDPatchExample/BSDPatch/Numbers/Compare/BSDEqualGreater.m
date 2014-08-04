//
//  BSDEqualGreater.m
//  BSDLang
//
//  Created by Travis Henspeter on 7/13/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDEqualGreater.h"

@implementation BSDEqualGreater

- (instancetype)initWithComparisonValue:(NSNumber *)comparisonValue
{
    return [super initWithArguments:comparisonValue];
}

- (void)setupWithArguments:(id)arguments
{
    self.name = @"equal or greater";
    NSNumber *initVal = (NSNumber *)arguments;
    if (initVal) {
        self.coldInlet.value = initVal;
    }else{
        self.coldInlet.value = @0;
    }
}

- (void)calculateOutput
{
    self.mainOutlet.value = @([self.hotInlet.value doubleValue] >= [self.coldInlet.value doubleValue]);
}

@end
