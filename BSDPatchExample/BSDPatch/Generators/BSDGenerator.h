//
//  BSDGenerator.h
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/20/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDObject.h"

@interface BSDGenerator : BSDObject

//BSDGenerator: Abstract superclass for objects that generate events

- (void)receivedNewData:(id)data;

@end
