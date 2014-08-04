//
//  BSDCounter.h
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/14/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDObject.h"

@interface BSDCounter : BSDObject

// Takes any NSObject as input/Output value and returns the incremented (NSNumber) value. Cold inlet stores current value.

- (instancetype)initWithStepSize:(NSNumber *)stepSize
                    initialValue:(NSNumber *)initialValue;

@end
