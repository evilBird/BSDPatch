//
//  BSDArrayDrip.h
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/20/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDObject.h"

@interface BSDArraySerialize : BSDObject

//BSDArraySeriaize: emits elements of an array sequentially as quickly as possible
//Hot inlet: Takes a bang
//Cold inlet: takes an array
//Main outlet: emits the elements of the array

- (instancetype)initWithArray:(NSArray *)array;

//Emits a bang when all elements of the array have been emitted
@property (nonatomic,strong)BSDOutlet *doneOutlet;

@end
