//
//  BSDValue.h
//  BSDLang
//
//  Created by Travis Henspeter on 7/13/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDObject.h"

@interface BSDValueBox : BSDObject

//Stores any NSObject in the cold inlet, sends the value to the main outlet when any input is received in the hot inlet

- (instancetype)initWithValue:(id)value;

@end
