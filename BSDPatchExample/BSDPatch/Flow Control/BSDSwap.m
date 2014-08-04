//
//  BSDSwap.m
//  BSDLang
//
//  Created by Travis Henspeter on 7/13/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDSwap.h"

@implementation BSDSwap

- (instancetype)initWithColdInletValue:(id)value
{
    return [super initWithArguments:value];
}

- (void)setupWithArguments:(id)arguments
{
    self.name = @"swap";
    self.rightOutlet = [[BSDOutlet alloc]init];
    self.rightOutlet.name = @"right outlet";
    
    self.leftOutlet = [[BSDOutlet alloc]init];
    self.leftOutlet.name = @"left outlet";

    [self addPort:self.rightOutlet];
    [self addPort:self.leftOutlet];
    
    if (arguments != NULL) {
        self.coldInlet.value = arguments;
    }
    
}

- (void)calculateOutput
{
    id hot = self.hotInlet.value;
    id cold = self.coldInlet.value;
    if (hot != NULL) {
        self.rightOutlet.value = hot;
    }
    if (cold != NULL) {
        self.leftOutlet.value = cold;
    }
}

@end
