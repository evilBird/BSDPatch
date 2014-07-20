//
//  BSDObject.h
//  BSDLang
//
//  Created by Travis Henspeter on 7/13/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BSDInlet.h"
#import "BSDOutlet.h"

@class BSDObject;

//The abstract super class for all BSDObjects. Encapsulates input/output behavior
@interface BSDObject : NSObject

// Human-readable name
@property (nonatomic,strong) NSString *name;
// Unique per-object identifier
@property (nonatomic,readonly) NSString *objectId;
// Debug an object by printing its debug description to the log
@property (nonatomic)BOOL debug;

// Default port configuration
@property (nonatomic,strong) BSDInlet *hotInlet;
@property (nonatomic,strong) BSDInlet *coldInlet;
@property (nonatomic,strong) BSDOutlet *mainOutlet;

// Keep a collection of additional ports
@property (nonatomic,strong) NSMutableArray *inlets;
@property (nonatomic,strong) NSMutableArray *outlets;

// Keep a reference to observed ports for managing KVO subscriptions
@property (nonatomic,strong) NSMutableSet *observedPorts;

// Execute block when main outlet emits a value
@property (nonatomic,strong) BSDObjectOutputBlock outputBlock;

// Optionally keep an array or dictionary of sub-objects
@property (nonatomic,strong) NSMutableArray *subobjects;

// designated initializer
- (instancetype) initWithArguments:(id)arguments;

// optionally configure after initializing
- (void) setupWithArguments:(id)arguments;

// Add ports
- (void) addPort:(BSDPort *)port;

// Get a reference to a specific port
- (BSDInlet *) inletNamed:(NSString *)name;
- (BSDOutlet *) outletNamed:(NSString *)name;

// Send output value
- (void) calculateOutput;
- (void) hotInlet:(BSDInlet *)inlet receivedValue:(id)value;

// Connect to other Objects/Inlets
- (void) connect:(BSDInlet *)inlet;
- (void) disconnect:(BSDInlet *)inlet;
- (void) connectOutlet:(BSDOutlet *)outlet toInlet:(BSDInlet *)inlet;

// Compare to other objects
- (BOOL) isEqual:(id)object;
- (BOOL) isBang: (id)value;
- (NSString *) debugDescription;
- (void) reset;

@end
