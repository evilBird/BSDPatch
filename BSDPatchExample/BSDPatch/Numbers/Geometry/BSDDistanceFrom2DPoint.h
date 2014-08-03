//
//  BSDDistanceFrom2D.h
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/19/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDObject.h"

@interface BSDDistanceFrom2DPoint : BSDObject

- (instancetype)initWithReferencePoint:(CGPoint)point;

@property (nonatomic,strong)BSDInlet *refPtInlet;

@end
