//
//  BSDImageView.h
//  VideoBlurExample
//
//  Created by Travis Henspeter on 8/13/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDObject.h"

@interface BSDImageView : BSDObject

- (instancetype)initWithUIImageView:(UIImageView *)imageView;

- (UIImageView *)imageView;

@property (nonatomic,strong)BSDInlet *getterInlet;
@property (nonatomic,strong)BSDOutlet *getterOutlet;

@end
