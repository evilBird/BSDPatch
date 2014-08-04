//
//  BSDPrependKey.h
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/19/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDObject.h"

@interface BSDAddKey : BSDObject

//Hot inlet takes any value, cold inlet takes a string. Outputs a dictionary with one key-value pair {coldValue: hotValue}
- (instancetype)initWithKey:(NSString *)key;

@end
