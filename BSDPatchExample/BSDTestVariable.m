//
//  BSDVariable.m
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/16/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDTestVariable.h"

@implementation BSDTestVariable

-(id)initVar1:(NSNumber *)var1 var2:(NSNumber *)var2 var3:(NSNumber *)var3
{
    self = [super init];
    if (self) {
        _var1 = var1;
        _var2 = var2;
        _var3 = var3;
    }
    
    return self;
}

@end
