//
//  BSDAdd.m
//  BSDLang
//
//  Created by Travis Henspeter on 7/12/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDAdd.h"

@implementation BSDAdd

- (instancetype)initWithPlusValue:(NSNumber *)plusValue
{
    return [super initWithArguments:plusValue];
}

- (void)setupWithArguments:(id)arguments
{
    self.name = @"add";
    NSNumber *plusValue = arguments;
    if (plusValue) {
        self.coldInlet.value = plusValue;
    }else{
        self.coldInlet.value = @0;
    }
}

- (void)calculateOutput
{
    self.mainOutlet.value = @([self.hotInlet.value doubleValue] + [self.coldInlet.value doubleValue]);
}

@end
