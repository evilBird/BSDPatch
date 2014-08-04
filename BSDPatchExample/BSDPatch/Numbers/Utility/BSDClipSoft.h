//
//  BSDClip.h
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/18/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDObject.h"

@interface BSDClipSoft : BSDObject

//BSDClip: Constrains numeric input values within a specified range
//Hot inlet: Takes an NSNumber to be clipped
//Min inlet: Takes an NSNumber, sets the lower bound below which input values are set to this value.
//Max inlet: Takes an NSNumber, sets the upper bound above which input values are set to this value.
//Main outlet: Emits the clipped input value.
//Usage: Get yer clip on, bro
//Creation arguments
//1. minValue - sets the initial value of the minInlet
//2. maxValue - sets the initial value of the maxInlet

- (instancetype)initWithMinValue:(NSNumber *)minValue
                        maxValue:(NSNumber *)maxValue;

@property (nonatomic,strong) BSDInlet *minInlet;
@property (nonatomic,strong) BSDInlet *maxInlet;

@end
