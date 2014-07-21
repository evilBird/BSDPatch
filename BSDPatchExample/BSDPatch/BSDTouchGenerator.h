//
//  BSDTouchGenerator.h
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/20/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDGenerator.h"

@interface BSDTouchGenerator : BSDGenerator

@property (nonatomic,strong) UIView *view;

- (instancetype)initWithView:(UIView *)view;

@end
