//
//  BSDSubtract.m
//  BSDLang
//
//  Created by Travis Henspeter on 7/12/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDSubtract.h"

@implementation BSDSubtract

- (instancetype)initWithDiffValue:(NSNumber *)diff
{
    return [super initWithArguments:diff];
}

- (void)setupWithArguments:(id)arguments
{
    self.name = @"subtract";
    NSNumber *diffValue = arguments;
    if (diffValue) {
        self.coldInlet.value = diffValue;
    }else{
        self.coldInlet.value = @0;
    }
}

- (void)calculateOutput
{
    self.mainOutlet.value = @([self.hotInlet.value doubleValue] - [self.coldInlet.value doubleValue]);
}

@end
