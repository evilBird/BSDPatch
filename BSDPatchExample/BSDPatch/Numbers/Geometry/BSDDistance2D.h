//
//  TestPatch.h
//  BSDLang
//
//  Created by Travis Henspeter on 7/13/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDObject.h"

@interface BSDDistance2D : BSDObject

//Input: takes an NSArray with two objects: a string and a value. The string denotes which coordinate component the value is related to. Example: an input of @[@"x0",@(100.0)] indicates the the x value of the reference coordinate (x0,y0) is 100. Similarly, and input of @[@"yf",@(250.0)] indicates that the y value of the coordinate from which distance to the reference coordinate is measured (xf,yf) has a value of 250.
//Output: NSNumber

@end
