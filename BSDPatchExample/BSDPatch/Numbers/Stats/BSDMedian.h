//
//  BSDMedian.h
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/15/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDObject.h"

@interface BSDMedian : BSDObject

//BSDMedian: calculates the running median of a stream of NSNumbers
//Hot inlet: Takes an NSNumber used to calculate the running median. When it receives a bang, the buffer is reset
//Cold inlet: Stores an optional buffer
//Main outlet: Emits the media of the buffer when a new value is received
//Count outlet: Emits the number of values being used to calculate the median

- (instancetype)initWithBufferSize:(NSNumber *)bufferSize;

@end
