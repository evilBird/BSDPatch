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
    return [[BSDMultiply alloc]initWithArguments:nil];
}

+ (BSDAdd *)add
{
    return [[BSDAdd alloc]initWithArguments:nil];
}

+ (BSDSubtract *)subtract
{
    return [[BSDSubtract alloc]initWithArguments:nil];
}

+ (BSDDivide *)divide
{
    return [[BSDDivide alloc]initWithArguments:nil];
}

+ (BSDSequence *)sequence:(id)arguments
{
    return [[BSDSequence alloc]initWithArguments:arguments];
}

+ (BSDSwap *)swap
{
    return [[BSDSwap alloc]initWithArguments:nil];
}

+ (BSDValue *)value
{
    return [[BSDValue alloc]initWithArguments:nil];
}

+ (BSDPower *)power
{
    return [[BSDPower alloc]initWithArguments:nil];
}

+ (BSDEqual *)equals
{
    return [[BSDEqual alloc]initWithArguments:nil];
}
+ (BSDGreater *)greater
{
    return [[BSDGreater alloc]initWithArguments:nil];
}
+ (BSDLess *)less
{
    return [[BSDLess alloc]initWithArguments:nil];
}
+ (BSDEqualGreater *)equalOrGreater
{
    return [[BSDEqualGreater alloc]initWithArguments:nil];
}
+ (BSDEqualLess *)equalOrLess
{
    return [[BSDEqualLess alloc]initWithArguments:nil];
}

+ (BSDAccum *)accumulate
{
    return [[BSDAccum alloc]initWithArguments:nil];
}

+ (BSDDistance *)distance
{
    return [[BSDDistance alloc]initWithArguments:@[@"x0",@"xf",@"y0",@"yf"]];
}
+ (BSDCounter *)counter
{
    return [[BSDCounter alloc]initWithArguments:nil];
}

+ (BSDAverage *)average
{
    return [[BSDAverage alloc]initWithArguments:nil];
}

+ (BSDStdDev *)standardDeviation
{
    return [[BSDStdDev alloc]initWithArguments:nil];
}

+ (BSDLog *)naturalLog
{
    return [[BSDLog alloc]initWithArguments:nil];
}

+ (BSDAbs *)absoluteValue
{
    return [[BSDAbs alloc]initWithArguments:nil];
}

+ (BSDPTest *)pTest
{
    return [[BSDPTest alloc]initWithArguments:nil];
}

+ (BSDChange *)change
{
    return [[BSDChange alloc]initWithArguments:nil];
}

+ (BSDMedian *)median
{
    return [[BSDMedian alloc]initWithArguments:nil];
}

+ (BSDArraySort *)arraySort:(id)arguments;
{
    return [[BSDArraySort alloc]initWithArguments:arguments];
}

+ (BSDArrayFilter *)arrayFilter:(id)arguments
{
    return [[BSDArrayFilter alloc]initWithArguments:arguments];
}

+ (BSDArrayNormalize *)normalize
{
    return [[BSDArrayNormalize alloc]initWithArguments:nil];
}

+ (BSDClassify *)classify:(id)arguments
{
    return [[BSDClassify alloc]initWithArguments:arguments];
}

@end
