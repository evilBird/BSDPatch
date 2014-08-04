//
//  BSDOutlet.m
//  BSDLang
//
//  Created by Travis Henspeter on 7/12/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDOutlet.h"
#import "BSDInlet.h"

@implementation BSDOutlet

- (void)connectToInlet:(BSDInlet *)inlet
{
    [inlet observePort:self];
}

- (void)disconnectFromInlet:(BSDInlet *)inlet
{
    [inlet stopObservingPort:self];
}

- (void)output:(id)value;
{
    [self setValue:value];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([object isKindOfClass:[BSDPort class]] && [self.observedPorts containsObject:object]) {
        [self setValue:[(BSDPort *)object value]];
    }
}

@end
