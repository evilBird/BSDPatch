//
//  BSDMax.h
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/18/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDObject.h"

@interface BSDMax : BSDObject

//Takes an NSNumber and ouputs the greater of the hot and cold inlet values
- (instancetype)initWithMax:(NSNumber *)max;

@end
