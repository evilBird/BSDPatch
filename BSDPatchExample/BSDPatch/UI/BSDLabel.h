//
//  BSDLabel.h
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/20/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDObject.h"

@interface BSDLabel : BSDObject

- (instancetype)initWithUILabel:(UILabel *)label;
- (UILabel *)label;

@end
