//
//  BSDClassify.h
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/15/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDObject.h"

@interface BSDArrayClassify : BSDObject

//BSDClassify takes an array of objects that conform to key-value coding and classifies them into discrete groups on the basis of predicates passed into the cold inlet. Outputs a dictionary of classified objects keyed by whether they are included in (1) or excluded from (0) each predicate

- (instancetype)initWithPredicates:(NSArray *)predicates;

@end
