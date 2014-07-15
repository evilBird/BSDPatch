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
    if (!self.connectedInlets) {
        self.connectedInlets = [NSMutableSet set];
    }
    
    [self.connectedInlets addObject:inlet];
    
    [self addObserver:inlet forKeyPath:@"value" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)disconnectInlet:(BSDInlet *)inlet
{
    if (self.connectedInlets && [self.connectedInlets containsObject:inlet]) {
        [self.connectedInlets removeObject:inlet];
    }
    
    [self removeObserver:inlet forKeyPath:@"value"];
}

- (void)sendValue:(id)value
{
    [self setValue:value];
}



@end
