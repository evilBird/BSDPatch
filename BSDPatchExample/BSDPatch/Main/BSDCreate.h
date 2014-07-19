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
+ (BSDBangBox *)bangBox;

+ (BSDSwap *)swap;
+ (BSDChange *)change;
+ (BSDSpigot *)spigot;
+ (BSDSpigot *)spigotCold:(NSNumber *)coldInletValue;


+ (BSDSequence *)sequenceInlets:(NSArray *)inlets;
+ (BSDRoute *)route;
+ (BSDRoute *)routeSelectors:(NSArray *)selectors;

+ (BSDBuffer *)buffer;
+ (BSDBuffer *)bufferSize:(NSNumber *)bufferSize;

+ (BSDMultiply *)multiply;
+ (BSDMultiply *)multiplyCold:(NSNumber *)coldInletValue;
+ (BSDAdd *)add;
+ (BSDSubtract *)subtract;
+ (BSDSubtract *)subtractCold:(NSNumber *)coldInletValue;
+ (BSDDivide *)divide;
+ (BSDValueBox *)valueBox;
+ (BSDValueBox *)valueBoxCold:(NSNumber *)coldInletValue;
+ (BSDPower *)power;
+ (BSDPower *)powerCold:(NSNumber *)coldInletValue;
+ (BSDLog *)naturalLog;
+ (BSDAbs *)absoluteValue;

+ (BSDMax *)max;
+ (BSDMax *)maxCold:(NSNumber *)coldInletValue;
+ (BSDMin *)min;
+ (BSDMin *)minCold:(NSNumber *)coldInletValue;
+ (BSDClip *)clip;
+ (BSDClip *)clipMin:(NSNumber *)minValue Max:(NSNumber *)maxValue;
+ (BSDClipFilter *)clipFilter;
+ (BSDClipFilter *)clipFilterMin:(NSNumber *)minValue Max:(NSNumber *)maxValue;

+ (BSDEqual *)equals;
+ (BSDEqual *)equalsCold:(NSNumber *)coldInletValue;
+ (BSDGreater *)greater;
+ (BSDGreater *)greaterCold:(NSNumber *)coldInletValue;
+ (BSDLess *)less;
+ (BSDLess *)lessCold:(NSNumber *)coldInletValue;
+ (BSDEqualGreater *)equalOrGreater;
+ (BSDEqualGreater *)equalOrGreaterCold:(NSNumber *)coldInletValue;
+ (BSDEqualLess *)equalOrLess;
+ (BSDEqualLess *)equalOrLessCold:(NSNumber *)coldInletValue;

+ (BSDAccum *)accumulate;
+ (BSDCounter *)counter;
+ (BSDCounter *)counterCold:(NSNumber *)coldInletValue stepSize:(NSNumber *)stepInletValue;
+ (BSDMod *) modulus;
+ (BSDMod *) modulusCold:(NSNumber *)coldInletValue;

+ (BSDAverage *)average;
+ (BSDAverage *)averageBufferSize:(NSNumber *)bufferSize;
+ (BSDDistance2D *)distance2D;
+ (BSDStdDev *)standardDeviation;
+ (BSDStdDev *)standardDeviationBufferSize:(NSNumber *)bufferSize;


+ (BSDPTest *)pTest;
+ (BSDPTest *)pTestAlpha:(NSNumber *)alpha bufferSize:(NSNumber *)bufferSize;
+ (BSDMedian *)median;
+ (BSDMedian *)medianBufferSize:(NSNumber *)bufferSize;

+ (BSDArrayBox *)arrayBox;
+ (BSDArrayBox *)arrayBoxCold:(NSArray *)coldInletValue;

+ (BSDArraySort *)arraySort:(id)arguments;
+ (BSDArrayFilter *)arrayFilter:(id)arguments;
+ (BSDArraySerialize *)arraySerialize;
+ (BSDArraySerialize *)arraySerializeCold:(NSArray *)array;
+ (BSDArrayElement *)arrayElement;
+ (BSDArrayElement *)arrayElementCold:(NSArray *)array;
+ (BSDArrayNormalize *)normalize;
+ (BSDClassify *)classify:(id)arguments;

@end
