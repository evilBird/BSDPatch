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

+ (BSDBang *)bang;
+ (BSDMultiply *)multiply;
+ (BSDMultiply *)multiplyCold:(NSNumber *)coldInletValue;
+ (BSDAdd *)add;
+ (BSDSubtract *)subtract;
+ (BSDSubtract *)subtractCold:(NSNumber *)coldInletValue;
+ (BSDDivide *)divide;
+ (BSDSwap *)swap;
+ (BSDSequence *)sequenceInlets:(NSArray *)inlets;
+ (BSDRoute *)route;
+ (BSDRoute *)routeSelectors:(NSArray *)selectors;
+ (BSDValue *)value;
+ (BSDPower *)power;
+ (BSDPower *)powerCold:(NSNumber *)coldInletValue;
+ (BSDEqual *)equals;
+ (BSDGreater *)greater;
+ (BSDLess *)less;
+ (BSDEqualGreater *)equalOrGreater;
+ (BSDEqualLess *)equalOrLess;
+ (BSDAccum *)accumulate;
+ (BSDCounter *)counter;
+ (BSDAverage *)average;
+ (BSDAverage *)averageBufferSize:(NSNumber *)bufferSize;
+ (BSDDistance2D *)distance2D;
+ (BSDStdDev *)standardDeviation;
+ (BSDStdDev *)standardDeviationBufferSize:(NSNumber *)bufferSize;
+ (BSDLog *)naturalLog;
+ (BSDAbs *)absoluteValue;
+ (BSDChange *)change;
+ (BSDPTest *)pTest;
+ (BSDPTest *)pTestAlpha:(NSNumber *)alpha bufferSize:(NSNumber *)bufferSize;
+ (BSDMedian *)median;
+ (BSDMedian *)medianBufferSize:(NSNumber *)bufferSize;
+ (BSDArraySort *)arraySort:(id)arguments;
+ (BSDArrayFilter *)arrayFilter:(id)arguments;
+ (BSDArrayNormalize *)normalize;
+ (BSDClassify *)classify:(id)arguments;

@end
