//
//  BSDSequence.h
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/15/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDObject.h"

@interface BSDSequence : BSDObject

//Input: any object can go in the hot inlet. Cold inlet is inactive
//Output: sends output to inlets in the order specified by the initializer

- (instancetype) initWithNumberOfOutlets:(NSNumber *)numberOfOutlets;
//convenience intitializer creates and connects an outlet for each intlet in the array
- (instancetype) initAndConnectToInlets:(NSArray *)inlets;

//get a specific outlet by index
- (BSDOutlet *)outletAtIndex:(NSNumber *)index;

//add outlets
- (BSDOutlet *)addOutlet;
- (BSDOutlet *)addOutletAndConnectToInlet:(BSDInlet *)inlet;

@end
