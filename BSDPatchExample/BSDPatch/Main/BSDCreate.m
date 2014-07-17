//
//  BSDCreate.m
//  BSDLang
//
//  Created by Travis Henspeter on 7/13/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDCreate.h"

@implementation BSDCreate

+ (BSDBang *)bang
{
    return [[BSDBang alloc]init];
}

+ (BSDMultiply *)multiply
{
    return [[BSDMultiply alloc]initWithArguments:nil];
}

+ (BSDMultiply *)multiplyCold:(NSNumber *)coldInletValue
{
    return [[BSDMultiply alloc]initWithArguments:coldInletValue];
}

+ (BSDAdd *)add
{
    return [[BSDAdd alloc]initWithArguments:nil];
}

+ (BSDSubtract *)subtract
{
    return [[BSDSubtract alloc]initWithArguments:nil];
}

+ (BSDSubtract *)subtractCold:(NSNumber *)coldInletValue
{
    return [[BSDSubtract alloc]initWithArguments:coldInletValue];
}

+ (BSDDivide *)divide
{
    return [[BSDDivide alloc]initWithArguments:nil];
}

+ (BSDSequence *)sequenceInlets:(NSArray *)inlets
{
    return [[BSDSequence alloc]initWithArguments:inlets];
}

+ (BSDRoute *)route
{
    return [[BSDRoute alloc]initWithArguments:nil];
}

+ (BSDRoute *)routeSelectors:(NSArray *)selectors
{
    return [[BSDRoute alloc]initWithArguments:selectors];
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

+ (BSDPower *)powerCold:(NSNumber *)coldInletValue
{
    return [[BSDPower alloc]initWithArguments:coldInletValue];
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

+ (BSDDistance2D *)distance2D
{
    return [[BSDDistance2D alloc]initWithArguments:nil];
}
+ (BSDCounter *)counter
{
    return [[BSDCounter alloc]initWithArguments:nil];
}

+ (BSDAverage *)average
{
    return [[BSDAverage alloc]initWithArguments:nil];
}

+ (BSDAverage *)averageBufferSize:(NSNumber *)bufferSize
{
    return [[BSDAverage alloc]initWithArguments:bufferSize];
}

+ (BSDStdDev *)standardDeviation
{
    return [[BSDStdDev alloc]initWithArguments:nil];
}

+ (BSDStdDev *)standardDeviationBufferSize:(NSNumber *)bufferSize
{
    return [[BSDStdDev alloc]initWithArguments:bufferSize];
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

+ (BSDPTest *)pTestAlpha:(NSNumber *)alpha bufferSize:(NSNumber *)bufferSize
{
    return [[BSDPTest alloc]initWithArguments:@[alpha,bufferSize]];
}

+ (BSDChange *)change
{
    return [[BSDChange alloc]initWithArguments:nil];
}

+ (BSDMedian *)median
{
    return [[BSDMedian alloc]initWithArguments:nil];
}

+ (BSDMedian *)medianBufferSize:(NSNumber *)bufferSize
{
    return [[BSDMedian alloc]initWithArguments:bufferSize];
}

+ (BSDArraySort *)arraySort:(id)arguments
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
