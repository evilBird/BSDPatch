//
//  BSDMainPatch.h
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/19/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDObject.h"
#import "BSDCreate.h"

@interface BSDCircleView : BSDObject

- (instancetype)initWithUIView:(UIView *)view;
- (UIView *)view;

@property(nonatomic,strong)BSDView *view1;
@property(nonatomic,strong)BSDMultiply *times;
@property(nonatomic,strong)BSDSwap *swapInput;
@property(nonatomic,strong)BSDSubtract *invertInput;
@property(nonatomic,strong)BSDDivide *divide;
@property(nonatomic,strong)BSDRect *view1rect;
@property(nonatomic,strong)BSDSwap *swapX;
@property(nonatomic,strong)BSDSubtract *minusX;
@property(nonatomic,strong)BSDSwap *swapY;
@property(nonatomic,strong)BSDSubtract *minusY;
@property(nonatomic,strong)BSDPrependKey *prependFrame;
@property(nonatomic,strong)BSDPrependKey *prependAlpha;

@end
