//
//  BSDSelect.h
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/20/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDObject.h"

@interface BSDSelect : BSDObject

//given a list of values and inlets, emit a bang to the inlet whose value matches the input

- (instancetype)initWithValues:(NSArray *)values inlets:(NSArray *)inlets;

@end
