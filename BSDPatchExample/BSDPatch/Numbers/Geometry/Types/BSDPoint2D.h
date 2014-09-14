//
//  BSDPoint.h
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/19/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDObject.h"

@interface BSDPoint2D : BSDObject

//BSDPoint: represents a dynamic coordinate built on CGPoint struct
//Hot inlet: Accepts a Bang, which outputs the current point
//X inlet (hot): Takes an NSNumber which is assigned to the x value of the point
//Y inlet (hot): Takes an NSNumber which is assigned to the y value of the point
//Main outlet: Emits an NSValue which wraps a CGPoint struct

- (instancetype)initWithCGPoint:(CGPoint)point;

@property (nonatomic,strong)BSDInlet *xInlet;
@property (nonatomic,strong)BSDInlet *yInlet;


@end
