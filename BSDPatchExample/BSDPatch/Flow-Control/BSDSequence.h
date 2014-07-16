//
//  BSDSequence.h
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/15/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDObject.h"

@interface BSDSequence : BSDObject

//Input: any object can go in the hot inlet. Cold inlet is inactive
//Output: sends output to inlets in the order specified by the initializer

- (id)initWithInlets:(NSArray *)inlets;

@end
