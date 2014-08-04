//
//  BSDArrayElement.h
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/18/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDObject.h"

@interface BSDArrayElement : BSDObject

//BSDArrayElement takes a (unsigned int) NSNumber in the hot inlet and a NSArray in the cold inlet. When the hot inlet receives a value, the main outlet outputs the array element at the index specified by the hot inlet value (if it is a valid index)

- (instancetype)initWithArray:(NSArray *)array;

@end
