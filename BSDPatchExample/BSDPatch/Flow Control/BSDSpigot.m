//
//  BSDSpigot.m
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/18/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDSpigot.h"

@implementation BSDSpigot

- (instancetype)initWithOpenState:(NSNumber *)openState
{
    return [super initWithArguments:openState];
}

- (void)setupWithArguments:(id)arguments
{
    self.name = @"spigot";
    NSNumber *initVal = (NSNumber *)arguments;
    if (initVal) {
        self.coldInlet.value = initVal;
    }else{
        self.coldInlet.value = @0;
    }
}

- (void)calculateOutput
{
    if ([self.coldInlet.value doubleValue] > 0) {
        self.mainOutlet.value = self.hotInlet.value;
    }
}

@end
