//
//  BSDRoute.h
//  BSDLang
//
//  Created by Travis Henspeter on 7/13/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDObject.h"

@interface BSDRoute : BSDObject

//Input: takes an NSArray with two objects: a string and a value, e.g. @["routing_tag",@(value)]
//Output: sends any NSObject out the outlet specified by the string in the input, e.g. the above array would cause @(value) to be sent from the outlet named "routing_tag"

@end
