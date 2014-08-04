//
//  BSDEqual.h
//  BSDLang
//
//  Created by Travis Henspeter on 7/13/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDObject.h"

@interface BSDEqual : BSDObject

//Input and Output are NSNumbers. Tests whether hot and cold inlet values are equal.
- (instancetype)initWithComparisonValue:(NSNumber *)comparisonValue;

@end
