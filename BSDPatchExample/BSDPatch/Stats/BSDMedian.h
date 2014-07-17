//
//  BSDMedian.h
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/15/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDObject.h"

@interface BSDMedian : BSDObject

@property (nonatomic,readonly) NSUInteger bufferSize;

- (id)initWithBufferSize:(NSUInteger)bufferSize;
- (void)reset;

@end
