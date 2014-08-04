//
//  BSDEstimatedPointView.h
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/19/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDObject.h"
#import "BSDCreate.h"

@interface BSDEstimatedPointView : BSDObject

@property (nonatomic,strong)BSDInlet *center;
@property (nonatomic,strong)BSDInlet *alpha;
@property (nonatomic,strong)BSDAddKey *prependAlpha;
@property (nonatomic,strong)BSDAddKey *prependCenter;
@property (nonatomic,strong)BSDView *mainView;

- (instancetype)initWithUIView:(UIView *)view;
- (UIView *)view;
+ (UIView *)newPointViewWithCenter:(CGPoint)center color:(UIColor *)color alpha:(CGFloat)alpha;


@end
