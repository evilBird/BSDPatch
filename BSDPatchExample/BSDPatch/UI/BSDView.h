//
//  BSDView.h
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/19/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDObject.h"

@interface BSDView : BSDObject

//BSDView: Set the properties of a UIView via a stream of key value pairs
//Hot inlet: Takes a dictionary containing key-value pairs
//Cold inlet: Stores a UIView instance
//Main outlet: Emits the UIView whenever its properties are updated

- (instancetype)initWithUIView:(UIView *)view;
- (UIView *)view;

@property (nonatomic,strong)BSDInlet *getterInlet;
@property (nonatomic,strong)BSDOutlet *getterOutlet;

@end
