//
//  BSDArraySerialize.h
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/18/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDObject.h"

@interface BSDArraySerialize : BSDObject

@property (nonatomic,readonly) BOOL wraps;
@property (nonatomic,readonly) BOOL reverse;
@property (nonatomic,strong) BSDInlet *arrayInlet;

@end
