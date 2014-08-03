//
//  BSDVariance.h
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/14/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDObject.h"

@class BSDCounter;
@interface BSDStdDev : BSDObject

@property (nonatomic, readonly) NSUInteger bufferSize;

//Input and output are NSNumbers
//Optionally BSDStdDev uses an input buffer to calculate a running average. By default the buffer is not used. To configure the buffer, use the - initWithBufferSize: initializer. Specify the number of values that should be used to compute the running average with the bufferSize argument.
@property (nonatomic,strong)BSDOutlet *muOut;
@property (nonatomic,strong)BSDOutlet *nOut;
@property (nonatomic,strong)BSDOutlet *inputVal;

- (id)initWithBufferSize:(NSUInteger)bufferSize;
- (void)reset;

@end
