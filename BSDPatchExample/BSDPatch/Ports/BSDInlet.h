//
//  BSDInlet.h
//  BSDLang
//
//  Created by Travis Henspeter on 7/12/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BSDPort.h"

@interface BSDInlet : BSDPort

@property (nonatomic,getter = isHot) BOOL hot;

- (instancetype)initHot;
- (instancetype)initCold;

// pass value to inlet
- (void)input:(id)input;

// forward received values to another inlet
//- (void)forwardInputToInlet:(BSDInlet *)inlet;
//- (void)removeForwardInlet:(BSDInlet *)inlet;

@end
