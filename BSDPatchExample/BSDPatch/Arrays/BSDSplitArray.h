//
//  BSDArraySplit.h
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/20/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDObject.h"

@interface BSDSplitArray : BSDObject

//split one array into two smaller arrays
- (instancetype)initWithArray:(NSArray *)array;

@property (nonatomic,strong)BSDOutlet *rightOutlet;

@end
