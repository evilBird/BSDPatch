//
//  BSDChange.h
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/15/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDObject.h"

@interface BSDChange : BSDObject

//Input: hot and cold inlets take any NSObject.
//Output: sends the hot inlet value if and only if the value has changed since the last input

- (instancetype)initWithComparisonValue:(id)value;

@end
