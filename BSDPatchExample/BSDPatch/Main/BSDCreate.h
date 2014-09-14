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
+ (BSDSwap *)swapCold:(id)coldInletValue;

+ (BSDChange *)change;

+ (BSDSpigot *)spigot;
+ (BSDSpigot *)spigotCold:(NSNumber *)coldInletValue;

+ (BSDAddKey *)prependKey;
+ (BSDAddKey *)prependKeyCold:(NSString *)coldInletValue;

+ (BSDSequence *)sequenceInlets:(NSArray *)inlets;

+ (BSDRoute *)route;
+ (BSDRoute *)routeKeys:(NSArray *)keys;
+ (BSDRoute *)routeWithKeys:(NSArray *)keys toInlets:(NSArray *)inlets;

+ (BSDBuffer *)buffer;
+ (BSDBuffer *)bufferSize:(NSNumber *)bufferSize;

+ (BSDReciprocal *)reciprocal;
+ (BSDReciprocal *)reciprocalCold:(NSNumber *)coldInletValue;

+ (BSDMultiply *)multiply;
+ (BSDMultiply *)multiplyCold:(NSNumber *)coldInletValue;

+ (BSDAdd *)add;
+ (BSDAdd *)addCold:(NSNumber *)coldInletValue;

+ (BSDSubtract *)subtract;
+ (BSDSubtract *)subtractCold:(NSNumber *)coldInletValue;

+ (BSDDivide *)divide;
+ (BSDDivide *)divideCold:(NSNumber *)coldInletValue;

+ (BSDValueBox *)valueBox;
+ (BSDValueBox *)valueBoxCold:(NSNumber *)coldInletValue;

+ (BSDExponent *)power;
+ (BSDExponent *)powerCold:(NSNumber *)coldInletValue;

+ (BSDNaturalLog *)naturalLog;
+ (BSDAbs *)absoluteValue;

+ (BSDMax *)max;
+ (BSDMax *)maxCold:(NSNumber *)coldInletValue;

+ (BSDMin *)min;
+ (BSDMin *)minCold:(NSNumber *)coldInletValue;

+ (BSDClipSoft *)clip;
+ (BSDClipSoft *)clipMin:(NSNumber *)minValue Max:(NSNumber *)maxValue;

+ (BSDClipHard *)clipFilter;
+ (BSDClipHard *)clipFilterMin:(NSNumber *)minValue Max:(NSNumber *)maxValue;

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

+ (BSDStdDev *)standardDeviation;
+ (BSDStdDev *)standardDeviationBufferSize:(NSNumber *)bufferSize;

+ (BSDDistance2D *)distance2D;

+ (BSDDistanceFrom2DPoint *)distanceFrom2DPoint;
+ (BSDDistanceFrom2DPoint *)distanceFrom2DPointCold:(NSValue *)coldInletValue;

+ (BSDIntersect2Circles *)intersect2Circles;

+ (BSDIntersect2CirclesHelper *)intersect2CirclesHelper;
+ (BSDIntersect2CirclesHelper *)intersect2CirclesHelperCold:(NSValue *)coldInletValue;

+ (BSDPTest *)pTest;
+ (BSDPTest *)pTestAlpha:(NSNumber *)alpha bufferSize:(NSNumber *)bufferSize;

+ (BSDMedian *)median;
+ (BSDMedian *)medianBufferSize:(NSNumber *)bufferSize;



+ (BSDArraySort *)arraySort:(id)arguments;

+ (BSDArrayFilter *)arrayFilter:(id)arguments;



+ (BSDArrayElement *)arrayElement;
+ (BSDArrayElement *)arrayElementCold:(NSArray *)array;

+ (BSDArrayNormalize *)normalize;

+ (BSDArrayClassify *)classify:(id)arguments;

+ (BSDView *)view;
+ (BSDView *)viewWithUIView:(UIView *)view;

+ (BSDRect *)rect;
+ (BSDRect *)rectWithCGRect:(CGRect)rect;

+ (BSDPoint2D *)point;
+ (BSDPoint2D *)pointWithCGPoint:(CGPoint)point;

+ (BSDFormatString *)formatString;
+ (BSDFormatString *)formatString:(NSString *)coldInletValue;

+ (BSDLabel *)label;
+ (BSDLabel *)labelWithUILabel:(UILabel*)label;

@end
