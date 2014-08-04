//
//  BSDArrayDripSlow.h
//  BSDPatchExample
//
//  Created by Travis Henspeter on 8/3/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDObject.h"

@interface BSDArrayEnumerate : BSDObject

//BSDArrayDrip: enumerates an array
//Hot inlet: takes a bang
//Cold inlet: takes an array
//Main outlet: outputs the next object in the array when a bang is received by the hot inlet
//Done outlet: outputs a bang when the last object in the array is emitted

- (instancetype)initWithArray:(NSArray *)array;

//Emits a bang when all elements of the array have been emitted
@property (nonatomic,strong)BSDOutlet *doneOutlet;

@end
