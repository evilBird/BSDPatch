//
//  BSDInlet.h
//  BSDLang
//
//  Created by Travis Henspeter on 7/12/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BSDPort.h"

@interface BSDInlet : BSDPort

- (void)input:(id)input;
- (void)bang;

@end
