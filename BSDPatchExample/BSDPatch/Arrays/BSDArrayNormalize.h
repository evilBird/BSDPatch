//
//  BSDArrayNormalize.h
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/15/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDObject.h"

@interface BSDArrayNormalize : BSDObject

//Normalizes an array so that its elements sum to a paricular value (by default 1.0).
//Input: hot inlet takes an NSArray of NSNumbers. cold inlet takes the value to which the array should be normalized
//Output: an NSArray of NSNumbers

- (instancetype)initWithNormalizingContstant:(NSNumber *)constant;

@end
