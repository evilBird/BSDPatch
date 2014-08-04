//
//  BSDAverage.h
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/14/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDObject.h"

@interface BSDAverage : BSDObject

//BSDAverage: Average a stream of numeric values, optionally with a fixed buffer
//Hot inlet: Takes an NSNumber to be included in the average. When it receives a bang, the average is reset
//Cold inlet: Stores the buffer used to calculate the running sum of received values
//Main outlet: Emits the the running average of received values
//Count outlet: Emits the nummber of values used to compute the running average as an NSNumber

- (instancetype)initWithBufferSize:(NSNumber *)bufferSize;

@property (nonatomic,strong)BSDOutlet *countOutlet;

@end
