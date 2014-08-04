//
//  BSDSpigot.h
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/18/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDObject.h"

@interface BSDSpigot : BSDObject

//BSDSpigot passes values received in the hot inlet when cold inlet value is an NSNumber greater than 0, otherwise emits no output

- (instancetype)initWithOpenState:(NSNumber *)openState;

@end
