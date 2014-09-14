//
//  BSDSpeedLimit.h
//  BSDPatchExample
//
//  Created by Travis Henspeter on 8/5/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDObject.h"

@interface BSDSpeedLimit : BSDObject

- (instancetype)initWithInterval:(NSNumber *)interval;

@property (nonatomic,getter=isReady)BOOL ready;

@end
