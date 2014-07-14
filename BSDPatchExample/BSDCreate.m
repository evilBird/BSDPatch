//
//  BSDCreate.m
//  BSDLang
//
//  Created by Travis Henspeter on 7/13/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDCreate.h"

@implementation BSDCreate

+ (BSDMultiply *)multiply
{
    return [[BSDMultiply alloc]init];
}

+ (BSDAdd *)add
{
    return [[BSDAdd alloc]init];
}

+ (BSDSubtract *)subtract
{
    return [[BSDSubtract alloc]init];
}

+ (BSDDivide *)divide
{
    return [[BSDDivide alloc]init];
}

+ (BSDSwap *)swap
{
    return [[BSDSwap alloc]init];
}

+ (BSDValue *)value
{
    return [[BSDValue alloc]init];
}

+ (BSDPower *)power
{
    return [[BSDPower alloc]init];
}

+ (BSDEqual *)equals
{
    return [[BSDEqual alloc]init];
}
+ (BSDGreater *)greater
{
    return [[BSDGreater alloc]init];
}
+ (BSDLess *)less
{
    return [[BSDLess alloc]init];
}
+ (BSDEqualGreater *)equalOrGreater
{
    return [[BSDEqualGreater alloc]init];
}
+ (BSDEqualLess *)equalOrLess
{
    return [[BSDEqualLess alloc]init];
}

@end
