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

- (void)connectInlet:(BSDInlet *)inlet
{
    [inlet observePort:self];
}

- (void)disconnectInlet:(BSDInlet *)inlet
{

    [inlet stopObservingPort:self];
}

- (void)sendValue:(id)value
{
    [self setValue:value];
}


@end
