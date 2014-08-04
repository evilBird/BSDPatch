//
//  BSDArrayFilter.h
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/15/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDObject.h"

@interface BSDArrayFilter : BSDObject

//BSDArrayFilter takes an NSArray of arbitrary (key-value coding compliant) values in the hot inlet and an NSPredicate in the cold inlet. When the hot inlet receives an input array, a filtered array is sent to the main outlet.

- (instancetype)initWithPredicates:(NSPredicate *)predicate;

@end
