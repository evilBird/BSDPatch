//
//  BSDPoint3D.h
//  BSDPatchExample
//
//  Created by Travis Henspeter on 8/4/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDObject.h"
#import "BSDNumberObjects.h"

@interface BSDPoint3D : BSDObject

//BSDPoint: represents a dynamic coordinate built on CGPoint struct
//Hot inlet: Accepts a Bang, which outputs the current point
//X inlet (hot): Takes an NSNumber which is assigned to the x value of the point
//Y inlet (hot): Takes an NSNumber which is assigned to the y value of the point
//Main outlet: Emits an NSValue which wraps a CGPoint struct

- (instancetype)initWith3DPoint:(BSD3DPoint)point;

@property (nonatomic,strong)BSDInlet *xInlet;
@property (nonatomic,strong)BSDInlet *yInlet;
@property (nonatomic,strong)BSDInlet *zInlet;
@end
