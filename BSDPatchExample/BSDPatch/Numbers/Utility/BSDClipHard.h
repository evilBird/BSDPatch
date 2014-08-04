//
//  BSDClipFilter.h
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/18/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDObject.h"

@interface BSDClipHard : BSDObject

//BSDClipHard: Clips a stream of numeric values within a range.
//Hot inlet: Takes a stream of numeric values to be clipped
//Min inlet: Takes an NSNumber, sets the minimum value below which input values are sent to the outofRangeOutlet
//Max inlet: Takes an NSNumber, set the maximum value above which input values are sent to the outOfRangeOutlet
//Main outlet: Emits only values that lies within the range defined by the minInlet and maxInlet values
//outOfRangeOutlet: Emits only values that lie outside the clipping range
//Creation arguments:
//1. minValue (NSNumber)
//2. maxValue (NSNumber)

- (instancetype)initWithMinValue:(NSNumber *)minValue
                        maxValue:(NSNumber *)maxValue;

@property (nonatomic,strong) BSDInlet *minInlet;
@property (nonatomic,strong) BSDInlet *maxInlet;

@property (nonatomic,strong) BSDOutlet *outOfRangeOutlet;

@end
