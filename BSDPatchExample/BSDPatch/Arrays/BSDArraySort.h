//
//  BSDArraySort.h
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/15/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDObject.h"

@interface BSDArraySort : BSDObject

//Input: hot inlet takes an instance of NSArray, cold inlet takes an instance or array of instances of NSSortDescriptor
//Output: a sorted array

- (instancetype)initWithSortDescriptors:(NSArray *)sortDescriptors;

@end
