//
//  BSDLayerAnimation.h
//  BSDPatchExample
//
//  Created by Travis Henspeter on 8/5/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDObject.h"

@interface BSDBasicAnimation : BSDObject

- (instancetype)initWithLayer:(CALayer *)layer animation:(CABasicAnimation *)animation;

@property(nonatomic,readonly)CALayer *layer;

@end
