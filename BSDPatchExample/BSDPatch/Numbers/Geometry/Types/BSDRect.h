//
//  BSDRect.h
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/19/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDObject.h"

@interface BSDRect : BSDObject

//BSDRect: Represents a CGRect with four vertices
//Hot inlet: Takes a bang, causing the current rect to be emitted from the main outlet
//Cold inlet: NA
//OriginXInlet (hot): Takes an NSNumber, sets the x origin for the represented rect
//OriginYInlet (hot): Takes an NSNumber, sets the y origin for the represented rect
//widthInlet (hot): Takes an NSNumber, sets the rect's width
//heightInlet (hot): Takes an NSNumber, set the rect's height
//Creation arguments:
//1. rect: an instance of CGRect 

- (instancetype)initWithCGRect:(CGRect)rect;

@property (nonatomic,strong)BSDInlet *originXInlet;
@property (nonatomic,strong)BSDInlet *originYInlet;
@property (nonatomic,strong)BSDInlet *widthInlet;
@property (nonatomic,strong)BSDInlet *heightInlet;

@end
