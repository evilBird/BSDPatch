//
//  BSDArrayAccum.h
//  BSDPatchExample
//
//  Created by Travis Henspeter on 8/5/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDObject.h"

@interface BSDArrayAccum : BSDObject

- (instancetype)initWithMaxLength:(NSNumber *)maxLength;

@property(nonatomic,strong)NSMutableArray *accumulated;

@end
