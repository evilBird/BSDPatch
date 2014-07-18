//
//  BSDValue.m
//  BSDLang
//
//  Created by Travis Henspeter on 7/13/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDValueBox.h"

@implementation BSDValueBox

- (void)setupWithArguments:(id)arguments
{
    self.name = @"value";
    NSNumber *initVal = (NSNumber *)arguments;
    if (initVal) {
        [self.coldInlet input:initVal];
    }else{
        [self.coldInlet input:@(0)];
    }
}

- (void)calculateOutput
{
    id hot = self.hotInlet.value;
    
    if ([self isBang:hot]) {
        self.mainOutlet.value = self.coldInlet.value;
    }else{
        self.mainOutlet.value = self.hotInlet.value;
    }
}

@end
