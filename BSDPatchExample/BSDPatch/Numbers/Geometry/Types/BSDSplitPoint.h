//
//  BSDPointSplit.h
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/20/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDObject.h"

@interface BSDSplitPoint : BSDObject

//BSDPointSplit: Splits a BSDPoint into its components and sends them to separate outlets
//Hot inlet: Takes a BSDPoint which is split into its components. Also takes a bang, which just outputs the current BSDPoint stored in the cold inlet
//Cold inlet: Stores the most recent BSDPoint
//Main outlet: emits input unchanged
//x: emits the point's x origin as an NSNumber
//y: emits the point's y origin as an NSNumber
//Creation arguments:
//1. Optionally pass an initial point to the cold inlet

- (instancetype)initWithCGPoint:(CGPoint)point;

@property (nonatomic,strong)BSDOutlet *x;
@property (nonatomic,strong)BSDOutlet *y;

@end
