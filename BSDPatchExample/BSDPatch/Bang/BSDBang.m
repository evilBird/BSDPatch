//
//  BSDBang.m
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/17/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDBang.h"

@implementation BSDBang

+ (BSDBang *)bang
{
    return [[BSDBang alloc]init];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _timeStamp = [NSDate date];
    }
    
    return self;
}

- (NSString *)uniqueId
{
    return [NSString stringWithFormat:@"%p",self];
}

@end
