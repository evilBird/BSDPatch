//
//  BSDSelect.h
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/20/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDObject.h"

@interface BSDSelect : BSDObject

//BSDSelect: compares input values against a values contained in an array of selectors. An outlet is created for each value in the array. Input values that match a selector value cause a bang to be emitted from the selected outlet

//initialize with an array of values against which hot inlet values will be compared
- (instancetype)initWithSelectors:(NSArray *)selectors;
- (instancetype)initAndConnectWithSelectorsAndInlets:(NSDictionary *)selectorsAndInlets;

//create an additional outlet for the specified selector
- (BSDOutlet *)addOutletForSelector:(id)selector;
- (BSDOutlet *)addOutletForSelector:(id)selector connectToInlet:(BSDInlet *)inlet;
//get an outlet for a specific selector value
- (BSDOutlet *)outletForSelector:(id)selector;


@end
