//
//  BSDSwap.h
//  BSDLang
//
//  Created by Travis Henspeter on 7/13/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDOBject.h"

@interface BSDSwap : BSDObject

//Input/Output can be any NSObject. When a new value is received by the hot inlet, this value is sent out the right outlet, while the cold inlet value is sent out the main outlet. 

- (instancetype)initWithColdInletValue:(id)value;

@property (nonatomic,strong)BSDOutlet *rightOutlet;
@property (nonatomic,strong)BSDOutlet *leftOutlet;

@end
