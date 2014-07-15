//
//  BSDCreate.h
//  BSDLang
//
//  Created by Travis Henspeter on 7/13/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BSDPrimitiveObjects.h"

@interface BSDCreate : NSObject

+ (BSDMultiply *)multiply;
+ (BSDAdd *)add;
+ (BSDSubtract *)subtract;
+ (BSDDivide *)divide;
+ (BSDSwap *)swap;
+ (BSDValue *)value;
+ (BSDPower *)power;
+ (BSDEqual *)equals;
+ (BSDGreater *)greater;
+ (BSDLess *)less;
+ (BSDEqualGreater *)equalOrGreater;
+ (BSDEqualLess *)equalOrLess;

@end
