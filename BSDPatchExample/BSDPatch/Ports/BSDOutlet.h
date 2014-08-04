//
//  BSDOutlet.h
//  BSDLang
//
//  Created by Travis Henspeter on 7/12/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BSDPort.h"

@class BSDInlet;
@class BSDOutlet;
@class BSDObject;

typedef void (^BSDObjectOutputBlock)(BSDObject *object, BSDOutlet *outlet);

@interface BSDOutlet : BSDPort

@property (nonatomic,strong)BSDObjectOutputBlock outputBlock;

- (void)connectToInlet:(BSDInlet *)inlet;
- (void)disconnectFromInlet:(BSDInlet *)inlet;
- (void)output:(id)value;

@end
