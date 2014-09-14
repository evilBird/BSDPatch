//
//  BSDLayer.h
//  BSDPatchExample
//
//  Created by Travis Henspeter on 8/5/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDObject.h"

@interface BSDLayer : BSDObject

- (instancetype)initWithCALayer:(CALayer *)layer;

@property (nonatomic,strong)CALayer *layer;
@property (nonatomic,strong)BSDInlet *getterInlet;
@property (nonatomic,strong)BSDOutlet *getterOutlet;

@end
