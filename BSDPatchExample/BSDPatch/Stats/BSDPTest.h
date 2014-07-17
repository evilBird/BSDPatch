//
//  BSDPTest.h
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/15/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDObject.h"

@interface BSDPTest : BSDObject

@property (nonatomic,readonly)NSUInteger bufferSize;
@property (nonatomic,readonly)double alpha;

- (instancetype)initWithAlpha:(double)alpha bufferSize:(NSUInteger)bufferSize;
- (void)reset;

@end
