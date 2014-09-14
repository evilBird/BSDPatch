//
//  BSDImageBlur.h
//  VideoBlurExample
//
//  Created by Travis Henspeter on 8/13/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDObject.h"
#import "UIImageEffects.h"
#import "HBVImageBlur.h"

@interface BSDImageBlur : BSDObject

- (instancetype)initWithBlurRadius:(NSNumber *)blurRadius saturation:(NSNumber*)saturation;

@property (nonatomic,strong)NSMutableDictionary *parameters;

@end
