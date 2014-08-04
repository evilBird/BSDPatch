//
//  BSDMainPatch.h
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/19/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDObject.h"
#import "BSDCreate.h"

@interface BSDReferencePointView : BSDObject

- (instancetype)initWithUIView:(UIView *)view;
- (UIView *)view;

@property(nonatomic,strong)BSDView *mainView;
@property(nonatomic,strong)BSDMultiply *times;
@property(nonatomic,strong)BSDSwap *swapInput;
@property(nonatomic,strong)BSDSubtract *invertInput;
@property(nonatomic,strong)BSDDivide *divide;
@property(nonatomic,strong)BSDRect *mainViewRect;
@property(nonatomic,strong)BSDSwap *swapX;
@property(nonatomic,strong)BSDSubtract *minusX;
@property(nonatomic,strong)BSDSwap *swapY;
@property(nonatomic,strong)BSDSubtract *minusY;
@property(nonatomic,strong)BSDAddKey *prependFrame;
@property(nonatomic,strong)BSDAddKey *prependAlpha;
@property(nonatomic,strong)UIView *centerView;

@end
