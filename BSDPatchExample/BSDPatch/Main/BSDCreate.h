//
//  BSDCreate.h
//  BSDLang
//
//  Created by Travis Henspeter on 7/13/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BSDObjects.h"

@interface BSDCreate : NSObject

+ (BSDMultiply *)multiply;
+ (BSDMultiply *)multiply:(NSNumber *)coldInletValue;
+ (BSDAdd *)add;
+ (BSDSubtract *)subtract;
+ (BSDSubtract *)subtract:(NSNumber *)coldInletValue;
+ (BSDDivide *)divide;
+ (BSDSwap *)swap;
+ (BSDSequence *)sequence:(NSArray *)inlets;
+ (BSDRoute *)route;
+ (BSDRoute *)route:(NSArray *)selectors;
+ (BSDValue *)value;
+ (BSDPower *)power;
+ (BSDPower *)power:(NSNumber *)coldInletValue;
+ (BSDEqual *)equals;
+ (BSDGreater *)greater;
+ (BSDLess *)less;
+ (BSDEqualGreater *)equalOrGreater;
+ (BSDEqualLess *)equalOrLess;
+ (BSDAccum *)accumulate;
+ (BSDCounter *)counter;
+ (BSDAverage *)average;
+ (BSDDistance2D *)distance2D;
+ (BSDStdDev *)standardDeviation;
+ (BSDLog *)naturalLog;
+ (BSDAbs *)absoluteValue;
+ (BSDChange *)change;
+ (BSDPTest *)pTest;
+ (BSDMedian *)median;
+ (BSDArraySort *)arraySort:(id)arguments;
+ (BSDArrayFilter *)arrayFilter:(id)arguments;
+ (BSDArrayNormalize *)normalize;
+ (BSDClassify *)classify:(id)arguments;

@end
