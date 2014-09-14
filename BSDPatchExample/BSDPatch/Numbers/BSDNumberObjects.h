//
//  BSDNumberObjects.h
//  BSDPatchExample
//
//  Created by Travis Henspeter on 8/3/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

//Basic Operations
#import "BSDMultiply.h"
#import "BSDAdd.h"
#import "BSDSubtract.h"
#import "BSDDivide.h"

#import "BSDNaturalLog.h"
#import "BSDAbs.h"
#import "BSDMod.h"
#import "BSDReciprocal.h"

//Comparison
#import "BSDGreater.h"
#import "BSDLess.h"
#import "BSDEqualGreater.h"
#import "BSDEqualLess.h"
#import "BSDLess.h"
#import "BSDEqual.h"

//Filters
#import "BSDInt.h"
#import "BSDMax.h"
#import "BSDMin.h"
#import "BSDClipSoft.h"
#import "BSDClipHard.h"

//Statistics
#import "BSDAccum.h"
#import "BSDAverage.h"
#import "BSDMedian.h"
#import "BSDStdDev.h"
#import "BSDPTest.h"

//Geometry
#import "BSDDistance2D.h"
#import "BSDIntersect2Circles.h"
#import "BSDIntersect2CirclesHelper.h"
#import "BSDDistanceFrom2DPoint.h"

//Geometry Types
#import "BSDRect.h"
#import "BSDRectSplit.h"
#import "BSDPoint2D.h"
#import "BSDSplitPoint.h"

typedef struct {
    double x;
    double y;
    double z;
} BSD3DPoint;