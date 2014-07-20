//
//  BSDEstimatedPointLabel.h
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/20/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDLabel.h"
#import "BSDCreate.h"

@interface BSDEstimatedPointLabel : BSDLabel

- (instancetype)initWithUILabel:(UILabel *)label pointName:(NSString *)pointName;

@property (nonatomic,strong)BSDInlet *estimatedPointInlet;
@property (nonatomic,strong)NSString *pointName;

@property (nonatomic,strong)BSDSplitPoint *splitPoint;
@property (nonatomic,strong)BSDInt *intX;
@property (nonatomic,strong)BSDInt *intY;
@property (nonatomic,strong)BSDArrayMake *makeArray;
@property (nonatomic,strong)BSDFormatString *formatString;
@property (nonatomic,strong)BSDPrependKey *prependTextKey;
@property (nonatomic,strong)BSDAdd *offsetCenter;
@property (nonatomic,strong)BSDPoint *makeCenter;
@property (nonatomic,strong)BSDPrependKey *prependCenterKey;


@end
