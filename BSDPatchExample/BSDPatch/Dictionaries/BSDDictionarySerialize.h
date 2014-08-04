//
//  BSDDictionaryDrip.h
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/20/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDObject.h"

@interface BSDDictionarySerialize : BSDObject

//BSDDictionarySerialize: serialize a dictionary into a stream of key-value pairs as quickly as possible
//Hot inlet: Takes an bang
//Cold inlet: Takes a dictionary
//Main outlet: Emits key-value pairs formatted as individual dictionaries
//Done outlet: Emits a bang when received dictionary has been serialized

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@property (nonatomic,strong)BSDOutlet *doneOutlet;

@end
