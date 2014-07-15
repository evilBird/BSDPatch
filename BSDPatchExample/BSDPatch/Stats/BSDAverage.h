//
//  BSDAverage.h
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/14/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDObject.h"

@interface BSDAverage : BSDObject

//Input and output are NSNumbers

//Optionally BSDAverage uses an input buffer to calculate a running average. By default the buffer is not used. To configure the buffer, use the - initWithBufferSize: initializer. Specify the number of values that should be used to compute the running average with the bufferSize argument.

- (id)initWithBufferSize:(NSUInteger)bufferSize;
- (void)reset;

@end
