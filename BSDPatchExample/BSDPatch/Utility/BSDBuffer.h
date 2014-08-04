//
//  BSDBuffer.h
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/18/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDObject.h"

@interface BSDBuffer : BSDObject

//BSDBuffer: a circular buffer holding arbitrary values
//Hot inlet: takes any object and adds it to the buffer. Sending a bang to the hot inlet resets the buffer
//Cold inlet: holds the buffer as a mutable array
//Main outlet: emits the contents of the buffer when a new value is added or a bang is received
//Aux outlet: when the buffer is at capacity, emits objects that are removed from the buffer

- (instancetype)initWithBufferSize:(NSNumber *)bufferSize;

@property (nonatomic,strong)BSDOutlet *auxOutlet;

@end
