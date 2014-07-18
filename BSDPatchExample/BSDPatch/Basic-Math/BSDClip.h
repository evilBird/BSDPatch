//
//  BSDClip.h
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/18/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDObject.h"

@interface BSDClip : BSDObject

@property (nonatomic,strong) BSDInlet *minInlet;
@property (nonatomic,strong) BSDInlet *maxInlet;

@end
