//
//  BSDRectSplit.h
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/20/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDObject.h"

@interface BSDRectSplit : BSDObject

//BSDRectSplit: Splits a BSDRect into its components and sends them to separate outlets
//Hot inlet: Takes a BSDRect which is split into its components. Also takes a bang, which just outputs the current BSDRect stored in the cold inlet
//Cold inlet: Stores the most recent BSDRect
//Main outlet: emits input unchanged
//originXOutlet: emits the rect's x origin as an NSNumber
//originYOutlet: emits the rect's y origin as an NSNumber
//widthOutlet: emits the rects' width as an NSNumber
//heightOutlet: emits the rect's height as an NSNumber
//Creation arguments:
//1. Optionally pass an initial Rect to the cold inlet
- (instancetype)initWithCGRect:(CGRect)rect;

@property (nonatomic,strong)BSDOutlet *originXOutlet;
@property (nonatomic,strong)BSDOutlet *originYOutlet;
@property (nonatomic,strong)BSDOutlet *widthOutlet;
@property (nonatomic,strong)BSDOutlet *heightOutlet;

@end
