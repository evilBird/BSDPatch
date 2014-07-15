//
//  BSDPTest.h
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/15/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDObject.h"

@interface BSDPTest : BSDObject

- (id)initWithSignificanceLevel:(double)significanceLevel;
- (id)initWithSignificanceLevel:(double)significanceLevel bufferSize:(NSUInteger)bufferSize;
- (void)reset;

@end
