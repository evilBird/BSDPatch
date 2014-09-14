//
//  BSDMetro.h
//  VideoBlurExample
//
//  Created by Travis Henspeter on 8/13/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDObject.h"

@interface BSDMetro : BSDObject

- (instancetype)initWithTimeInterval:(NSNumber *)timeInterval;

@property (nonatomic,strong)NSTimer *timer;

@end
