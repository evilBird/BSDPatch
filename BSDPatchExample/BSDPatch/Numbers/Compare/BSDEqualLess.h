//
//  BSDEqualLess.h
//  BSDLang
//
//  Created by Travis Henspeter on 7/13/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDObject.h"

@interface BSDEqualLess : BSDObject

//Input and Output are NSNumbers. Tests whether hot inlet value is equal or less than cold inlet value.
- (instancetype)initWithComparisonValue:(NSNumber *)comparisonValue;

@end
