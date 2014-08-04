//
//  BSDMin.h
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/18/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDObject.h"

@interface BSDMin : BSDObject

//Takes NSNumbers in hot and cold inlets. Outputs the minimum of hot and cold inlet values.
- (instancetype)initWithMin:(NSNumber *)min;

@end
