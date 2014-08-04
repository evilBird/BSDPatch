//
//  BSDExamplePatch.h
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/20/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDObject.h"
#import "BSDCreate.h"
#import "BSDReferencePointView.h"
#import "BSDEstimatedPointView.h"
#import "BSDEstimatedPointLabel.h"

@interface BSDExamplePatch : BSDObject

//reference points
@property(nonatomic)CGPoint refpt1;
@property(nonatomic)CGPoint refpt2;

@property(nonatomic,strong)BSDTouchGenerator *touchGenerator;
@property(nonatomic,strong)BSDDictionarySerialize *touchDrip;
@property(nonatomic,strong)BSDRoute *touchRoute;
@property(nonatomic,strong)BSDSequence *touchSequence;

@property(nonatomic,strong)BSDReferencePointView *refPtView1;
@property(nonatomic,strong)BSDReferencePointView *refPtView2;

@property(nonatomic,strong)BSDDistanceFrom2DPoint *distanceFromRefPt1;
@property(nonatomic,strong)BSDIntersect2CirclesHelper *distance1Helper;

@property(nonatomic,strong)BSDDistanceFrom2DPoint *distanceFromRefPt2;
@property(nonatomic,strong)BSDIntersect2CirclesHelper *distance2Helper;

@property(nonatomic,strong)BSDIntersect2Circles *intersect2circles;

@property(nonatomic,strong)BSDEstimatedPointView *estPtView_i;
@property(nonatomic,strong)BSDEstimatedPointView *estPtView_j;

@property(nonatomic,strong)BSDEstimatedPointLabel *estPtLab_i;
@property(nonatomic,strong)BSDEstimatedPointLabel *estPtLab_j;

@property(nonatomic,strong)BSDDictionarySerialize *drip;
@property(nonatomic,strong)BSDRoute *route;

- (instancetype)initWithSuperview:(UIView *)superview;

@end
