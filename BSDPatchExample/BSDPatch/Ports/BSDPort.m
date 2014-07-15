//
//  BSDPort.m
//  BSDLang
//
//  Created by Travis Henspeter on 7/13/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDPort.h"

@implementation BSDPort

- (id)initWithValue:(id)value
{
    self = [super init];
    if (self) {
        _value = value;
        _name = nil;
    }
    
    return self;
}

- (id)initWithValue:(id)value name:(NSString *)name
{
    self = [super init];
    if (self) {
        _value = value;
        _name = name;
        _patchId = [NSNumber numberWithInteger:arc4random_uniform(1000000)];
    }
    
    return self;
}

- (id)initWithValue:(id)value name:(NSString *)name patchId:(NSNumber *)patchId
{
    self = [super init];
    if (self) {
        _value = value;
        _name = name;
        _patchId = patchId;
    }
    
    return self;
}


@end
