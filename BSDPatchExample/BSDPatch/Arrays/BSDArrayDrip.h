//
//  BSDArrayDrip.h
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/20/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDObject.h"

@interface BSDArrayDrip : BSDObject

//BSDArrayDrip takes an array in the cold inlet. When it receives a bang in the hot inlet, each element of the stored array is emitted sequentially from the main outlet as quickly as possible.

- (instancetype)initWithArray:(NSArray *)array;

//Emits a bang when all elements of the array have been emitted
@property (nonatomic,strong)BSDOutlet *doneOutlet;

@end
