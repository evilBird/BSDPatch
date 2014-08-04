//
//  BSDArrayMake.h
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/20/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDObject.h"

@interface BSDArrayPack : BSDObject

//BSDArrayPack creates an array from elements received in multiple inlets. The number of inlets can be specified explicitly as a creation argument, or added one at a time. Specific inlets can be retrieved given by their index. BSDArrayPack emits an array composed of its contcatenated inlet values when a bang is received in the hot inlet. Inlets with no assigned value are represented in the output array by an instance of NSNull.

- (instancetype)initWithNumberOfInlets:(NSNumber *)numberOfInlets;
- (instancetype)initAndConnectToOutlets:(NSArray *)outlets;

- (BSDInlet *)inletAtIndex:(NSNumber *)index;
- (BSDInlet *)addInlet;
- (BSDInlet *)addInletAndConnectToOutlet:(BSDOutlet *)outlet;


@end
