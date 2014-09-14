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

+ (UILabel *)newLabelWithFrame:(CGRect)frame textColor:(UIColor *)color;

@property (nonatomic,strong)BSDInlet *estimatedPointInlet;
@property (nonatomic,strong)NSString *pointName;

@property (nonatomic,strong)BSDSplitPoint *splitPoint;
@property (nonatomic,strong)BSDInt *intX;
@property (nonatomic,strong)BSDInt *intY;
@property (nonatomic,strong)BSDArrayPack *makeArray;
@property (nonatomic,strong)BSDFormatString *formatString;
@property (nonatomic,strong)BSDAddKey *prependTextKey;
@property (nonatomic,strong)BSDAdd *offsetCenter;
@property (nonatomic,strong)BSDPoint2D *makeCenter;
@property (nonatomic,strong)BSDAddKey *prependCenterKey;


@end
