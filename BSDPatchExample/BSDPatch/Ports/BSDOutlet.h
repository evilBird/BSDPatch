//
//  BSDOutlet.h
//  BSDLang
//
//  Created by Travis Henspeter on 7/12/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BSDPort.h"

@class BSDInlet;

@interface BSDOutlet : BSDPort

@property (nonatomic,strong)NSMutableSet *connectedInlets;

- (void)connectInlet:(BSDInlet *)inlet;
- (void)disconnectInlet:(BSDInlet *)inlet;
- (void)sendValue:(id)value;

@end
