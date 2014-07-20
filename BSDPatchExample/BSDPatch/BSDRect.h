//
//  BSDRect.h
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/19/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDObject.h"

@interface BSDRect : BSDObject

- (instancetype)initWithCGRect:(CGRect)rect;

@property (nonatomic,strong)BSDInlet *originXInlet;
@property (nonatomic,strong)BSDInlet *originYInlet;
@property (nonatomic,strong)BSDInlet *widthInlet;
@property (nonatomic,strong)BSDInlet *heightInlet;

@end
