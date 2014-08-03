//
//  BSDD2CHelper.h
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/19/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDObject.h"

@interface BSDIntersect2CirclesHelper : BSDObject

/* BSDIntersect2CirclesHelper converts a radius and center point of a circle to an NSDictionary that can be read by BSDIntersect2Cirlces */

@property (nonatomic,strong)BSDInlet *circleRadius; //hot inlet, takes an NSNumber
@property (nonatomic,strong)BSDInlet *cicleCenter; //cold inlet, takes a NSValue wrapping a CGPoint


@end
