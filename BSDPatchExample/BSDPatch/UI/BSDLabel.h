//
//  BSDLabel.h
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/20/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDObject.h"

@interface BSDLabel : BSDObject

//BSDLabel: Set the properties of a UIView via a stream of key value pairs
//Hot inlet: Takes a dictionary containing key-value pairs
//Cold inlet: Stores a UILabel instance
//Main outlet: Emits the UILabel whenever its properties are updated

- (instancetype)initWithUILabel:(UILabel *)label;
- (UILabel *)label;

@end
