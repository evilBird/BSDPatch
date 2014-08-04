//
//  BSDAccum.h
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/14/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDObject.h"

@interface BSDAccum : BSDObject

//BSDAccum: Accumulate numeric values in a running sum
//Hot inlet: Takes an NSNumber or a bang. Numbers are added to the running sum. When a bang is received, the running sum is reset.
//Cold inlet: stores running sum as NSNumber
//Main outlet: emits the running sum as an NSNumber



@end
