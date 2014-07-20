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
    return [BSDBang bang];
}

+ (BSDBangBox *)bangBox
{
    return [[BSDBangBox alloc]initWithArguments:nil];
}

+ (BSDBuffer *)buffer
{
    return [[BSDBuffer alloc]initWithArguments:nil];
}
+ (BSDBuffer *)bufferSize:(NSNumber *)bufferSize
{
    return [[BSDBuffer alloc]initWithArguments:bufferSize];
}

+ (BSDSpigot *)spigot
{
    return [[BSDSpigot alloc]initWithArguments:nil];
}

+ (BSDSpigot *)spigotCold:(NSNumber *)coldInletValue
{
    return [[BSDSpigot alloc]initWithArguments:coldInletValue];
}

+ (BSDPrependKey *)prependKey
{
    return [[BSDPrependKey alloc]initWithArguments:nil];
}

+ (BSDPrependKey *)prependKeyCold:(NSString *)coldInletValue
{
    return [[BSDPrependKey alloc]initWithArguments:coldInletValue];
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

+ (BSDDivide *)divideCold:(NSNumber *)coldInletValue
{
    return [[BSDDivide alloc]initWithArguments:coldInletValue];
}

+ (BSDReciprocal *)reciprocal
{
    return [[BSDReciprocal alloc]initWithArguments:nil];
}

+ (BSDReciprocal *)reciprocalCold:(NSNumber *)coldInletValue
{
    return [[BSDReciprocal alloc]initWithArguments:coldInletValue];
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

+ (BSDSwap *)swapCold:(id)coldInletValue
{
    return [[BSDSwap alloc]initWithArguments:coldInletValue];
}

+ (BSDValueBox *)valueBox
{
    return [[BSDValueBox alloc]initWithArguments:nil];
}

+ (BSDValueBox *)valueBoxCold:(NSNumber *)coldInletValue
{
    return [[BSDValueBox alloc]initWithArguments:coldInletValue];
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

+ (BSDEqual *)equalsCold:(NSNumber *)coldInletValue
{
    return [[BSDEqual alloc]initWithArguments:coldInletValue];
}
+ (BSDGreater *)greaterCold:(NSNumber *)coldInletValue
{
    return [[BSDGreater alloc]initWithArguments:coldInletValue];
}
+ (BSDLess *)lessCold:(NSNumber *)coldInletValue
{
    return [[BSDLess alloc]initWithArguments:coldInletValue];
}

+ (BSDEqualGreater *)equalOrGreater
{
    return [[BSDEqualGreater alloc]initWithArguments:nil];
}

+ (BSDEqualGreater *)equalOrGreaterCold:(NSNumber *)coldInletValue
{
    return [[BSDEqualGreater alloc]initWithArguments:coldInletValue];
}

+ (BSDEqualLess *)equalOrLess
{
    return [[BSDEqualLess alloc]initWithArguments:nil];
}

+ (BSDEqualLess *)equalOrLessCold:(NSNumber *)coldInletValue
{
    return [[BSDEqualLess alloc]initWithArguments:coldInletValue];
}

+ (BSDMax *)max
{
    return [[BSDMax alloc]initWithArguments:nil];
}

+ (BSDMax *)maxCold:(NSNumber *)coldInletValue
{
    return [[BSDMax alloc]initWithArguments:coldInletValue];
}

+ (BSDMin *)min
{
    return [[BSDMin alloc]initWithArguments:nil];
}

+ (BSDMin *)minCold:(NSNumber *)coldInletValue
{
    return [[BSDMin alloc]initWithArguments:coldInletValue];
}

+ (BSDClip *)clip
{
    return [[BSDClip alloc]initWithArguments:nil];
}

+ (BSDClip *)clipMin:(NSNumber *)minValue Max:(NSNumber *)maxValue
{
    return [[BSDClip alloc]initWithArguments:@[minValue,maxValue]];
}

+ (BSDClipFilter *)clipFilter
{
    return [[BSDClipFilter alloc]initWithArguments:nil];
}

+ (BSDClipFilter *)clipFilterMin:(NSNumber *)minValue Max:(NSNumber *)maxValue
{
    return [[BSDClipFilter alloc]initWithArguments:@[minValue,maxValue]];
}

+ (BSDAccum *)accumulate
{
    return [[BSDAccum alloc]initWithArguments:nil];
}

+ (BSDDistance2D *)distance2D
{
    return [[BSDDistance2D alloc]initWithArguments:nil];
}

+ (BSDDistanceFrom2DPoint *)distanceFrom2DPoint
{
    return [[BSDDistanceFrom2DPoint alloc]initWithArguments:nil];
}

+ (BSDDistanceFrom2DPoint *)distanceFrom2DPointCold:(NSValue *)coldInletValue
{
    return [[BSDDistanceFrom2DPoint alloc]initWithArguments:coldInletValue];
}

+ (BSDIntersect2Circles *)intersect2Circles
{
    return [[BSDIntersect2Circles alloc]initWithArguments:nil];
}

+ (BSDIntersect2CirclesHelper *)intersect2CirclesHelper
{
    return [[BSDIntersect2CirclesHelper alloc]initWithArguments:nil];
}

+ (BSDIntersect2CirclesHelper *)intersect2CirclesHelperCold:(NSValue *)coldInletValue
{
    return [[BSDIntersect2CirclesHelper alloc]initWithArguments:coldInletValue];
}

+ (BSDCounter *)counter
{
    return [[BSDCounter alloc]initWithArguments:nil];
}

+ (BSDCounter *)counterCold:(NSNumber *)coldInletValue stepSize:(NSNumber *)stepInletValue
{
    return [[BSDCounter alloc]initWithArguments:@[coldInletValue,stepInletValue]];
}

+ (BSDMod *) modulus
{
    return [[BSDMod alloc]initWithArguments:nil];
}

+ (BSDMod *) modulusCold:(NSNumber *)coldInletValue
{
    return [[BSDMod alloc]initWithArguments:coldInletValue];
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

+ (BSDArrayBox *)arrayBox
{
    return [[BSDArrayBox alloc]initWithArguments:nil];
}

+ (BSDArrayBox *)arrayBoxCold:(NSArray *)coldInletValue
{
    return [[BSDArrayBox alloc]initWithArguments:coldInletValue];
}

+ (BSDArraySort *)arraySort:(id)arguments
{
    return [[BSDArraySort alloc]initWithArguments:arguments];
}

+ (BSDArrayFilter *)arrayFilter:(id)arguments
{
    return [[BSDArrayFilter alloc]initWithArguments:arguments];
}

+ (BSDArraySerialize *)arraySerialize
{
    return [[BSDArraySerialize alloc]initWithArguments:nil];
}
+ (BSDArraySerialize *)arraySerializeCold:(NSArray *)array
{
    return [[BSDArraySerialize alloc]initWithArguments:array];
}

+ (BSDArrayElement *)arrayElement
{
    return [[BSDArrayElement alloc]initWithArguments:nil];
}

+ (BSDArrayElement *)arrayElementCold:(NSArray *)array
{
    return [[BSDArrayElement alloc]initWithArguments:array];
}

+ (BSDArrayNormalize *)normalize
{
    return [[BSDArrayNormalize alloc]initWithArguments:nil];
}

+ (BSDClassify *)classify:(id)arguments
{
    return [[BSDClassify alloc]initWithArguments:arguments];
}

+ (BSDRect *)rect
{
    return [[BSDRect alloc]initWithArguments:nil];
}

+ (BSDRect *)rectWithCGRect:(CGRect)rect
{
    return [[BSDRect alloc]initWithCGRect:rect];
}

+ (BSDView *)view
{
    return [[BSDView alloc]initWithArguments:nil];
}
+ (BSDView *)viewWithUIView:(UIView *)view
{
    return [[BSDView alloc]initWithUIView:view];
}

@end
