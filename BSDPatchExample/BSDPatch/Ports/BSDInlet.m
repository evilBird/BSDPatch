//
//  BSDInlet.m
//  BSDLang
//
//  Created by Travis Henspeter on 7/12/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDInlet.h"
#import "BSDOutlet.h"


@implementation BSDInlet

- (instancetype)initHot
{
    self = [super init];
    if (self) {
        _hot = YES;
    }
    return self;
}

- (instancetype)initCold
{
    return [super init];
}

- (void)bang
{
    [self input:self.value];
}

- (void)input:(id)input;
{
    self.value = input;
}

- (void)forwardInputToInlet:(BSDInlet *)inlet
{
    [inlet observePort:self];
}

- (void)removeForwardInlet:(BSDInlet *)inlet
{
    [inlet stopObservingPort:self];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([object isKindOfClass:[BSDPort class]] && [self.observedPorts containsObject:object]) {
        [self input:[(BSDPort *)object value]];
    }
}

@end
