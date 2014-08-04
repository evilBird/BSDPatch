//
//  BSDValue.m
//  BSDLang
//
//  Created by Travis Henspeter on 7/13/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDValueBox.h"

@implementation BSDValueBox

- (instancetype)initWithValue:(id)value
{
    return [super initWithArguments:value];
}

- (void)setupWithArguments:(id)arguments
{
    self.name = @"value";
    if (arguments != NULL) {
        self.coldInlet.value = arguments;
    }
}

- (void)inletReceievedBang:(BSDInlet *)inlet
{
    if ([inlet isEqual:self.hotInlet]) {
        self.mainOutlet.value = self.coldInlet.value;
    }
}


@end
