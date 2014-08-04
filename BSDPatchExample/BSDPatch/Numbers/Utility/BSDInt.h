//
//  BSDInt.h
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/20/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDObject.h"

@interface BSDInt : BSDObject

//BSDInt: Converts a numeric value to integer by truncation
//Hot inlet: Takes an NSNumber to be truncated
//Cold inlet:NA
//Hot inlet: Emits a truncated NSNumber when the hot inlet receives a value


@end
