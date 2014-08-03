//
//  BSDPoint.h
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/19/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDObject.h"

@interface BSDPoint : BSDObject

@property (nonatomic,strong)BSDInlet *xInlet;
@property (nonatomic,strong)BSDInlet *yInlet;

- (instancetype)initWithCGPoint:(CGPoint)point;

@end
