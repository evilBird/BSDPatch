//
//  BSDDistanceToCoordinate.h
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/19/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDObject.h"

@interface BSDIntersect2Circles : BSDObject

/* BSDIntersect2Circles attempts to calculate the coordinates at which 2 circles intersect. If the circles intersect, Main outlet emits an dictionary containing NSValue wrapped-CGPoints, keyed as "i" and "j". If the circles do not intersect, main outlet emits NULL */

@property (nonatomic,strong)BSDInlet *circle1; //hot inlet, takes an NSDictionary containing appropriate values for keys "center" and "radius"
@property (nonatomic,strong)BSDInlet *circle2; //cold inlet, same input type

@property (nonatomic,strong)BSDOutlet *circle1Center;
@property (nonatomic,strong)BSDOutlet *circle2Center;

- (void)extendedDebugging:(BOOL)extendedDebug;

@end
