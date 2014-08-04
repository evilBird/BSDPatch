//
//  BSDDistanceFrom2D.m
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/19/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDDistanceFrom2DPoint.h"
#import "BSDCreate.h"

@interface BSDDistanceFrom2DPoint ()

@property (nonatomic,strong)BSDSequence *inputSequence;

@property (nonatomic,strong)BSDSubtract *diffX;
@property (nonatomic,strong)BSDSubtract *diffY;
@property (nonatomic,strong)BSDExponent *squareX;
@property (nonatomic,strong)BSDExponent *squareY;
@property (nonatomic,strong)BSDAdd *addSquares;
@property (nonatomic,strong)BSDExponent *rootSum;

@end

@implementation BSDDistanceFrom2DPoint

- (instancetype)initWithReferencePoint:(CGPoint)point
{
    return [super initWithArguments:[NSValue wrapPoint:point]];
}


- (void)setupWithArguments:(id)arguments
{
    
    self.name = @"2D distance from";
    //repurpose our cold inlet so the appropriate objects are updated when a new value is received
    
    self.refPtInlet = self.coldInlet;
    self.refPtInlet.name = @"reference point";
    self.refPtInlet.hot = YES;
    
    NSValue *referencePoint = (NSValue *)arguments;
    CGPoint pt;
    if (referencePoint) {
        self.refPtInlet.value = referencePoint;
        pt = [referencePoint CGPointValue];
    }else{
        pt.x = 0.0;
        pt.y = 0.0;
        self.refPtInlet.value = [NSValue wrapPoint:pt];
    }
    
    self.diffX = [BSDCreate subtractCold:@(pt.x)];
    self.diffY = [BSDCreate subtractCold:@(pt.y)];
    self.squareX = [BSDCreate powerCold:@(2)];
    self.squareY = [BSDCreate powerCold:@(2)];
    self.addSquares = [BSDCreate add];
    self.rootSum = [BSDCreate powerCold:@(0.5)];
        
    [self.diffX connect:self.squareX.hotInlet];
    [self.diffY connect:self.squareY.hotInlet];
    [self.squareY connect:self.addSquares.coldInlet];
    [self.squareX connect:self.addSquares.hotInlet];
    [self.addSquares connect:self.rootSum.hotInlet];
    
    [self.rootSum.mainOutlet forwardToPort:self.mainOutlet];
}

- (void) hotInlet:(BSDInlet *)inlet receivedValue:(id)value
{
    //override to get access to the hot inlet that changed
    if ([inlet isEqual:self.refPtInlet]) {
        NSValue *newRefPt = value;
        if (newRefPt) {
            CGPoint pt = [newRefPt CGPointValue];
            [self.diffX.coldInlet input:@(pt.x)];
            [self.diffY.coldInlet input:@(pt.y)];
        }
    }
}

- (void)calculateOutput
{
    NSValue *hot = self.hotInlet.value;
    if (hot) {
        CGPoint pt = [hot CGPointValue];
        [self.diffY.hotInlet input:@(pt.y)];
        [self.diffX.hotInlet input:@(pt.x)];
    }
}

@end
