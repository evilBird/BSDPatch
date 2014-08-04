//
//  BSDArrayPrepend.h
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/20/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDObject.h"

@interface BSDArrayPrepend : BSDObject

//BSDArrayPrepend: Insert a value at the beginning of an array
//Hot inlet: takes an array
//Cold inlet: takes any value
//Main outlet: outputs an array with the cold inlet value prepended to the array received in the hot inlet

- (instancetype)initWithPrependValue:(id)value;

@end
