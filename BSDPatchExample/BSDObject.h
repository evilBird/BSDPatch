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
@protocol BSDObjectOutputUser <NSObject>

- (void)BSDObject:(BSDObject *)object sentOutputValue:(id)value;

@end

@interface BSDObject : NSObject <BSDObjectOutputUser>

// Human-readable name
@property (nonatomic,strong)NSString *name;
// Unique per-object identifier
@property (nonatomic,readonly)NSString *objectId;

// Default I/O configuration
@property (nonatomic,strong)BSDInlet *hotInlet;
@property (nonatomic,strong)BSDInlet *coldInlet;
@property (nonatomic,strong)BSDOutlet *mainOutlet;

// Optionally keep an array or dictionary of sub-objects
@property (nonatomic,strong)NSMutableArray *processingChain;

// Optionally keep a collection of additional inlets/outlets
@property (nonatomic,strong)NSMutableDictionary *inlets;
@property (nonatomic,strong)NSMutableDictionary *outlets;
@property (nonatomic,strong)NSString *activeOutletName;

// Optionally add output user which receives callbacks whenenver a new value is output
@property (nonatomic,weak)id<BSDObjectOutputUser> outputUser;

// Constructors
- (id)initWithArguments:(id)arguments;

// Get inlet values
- (id)hotInletValue;
- (id)hot;
- (id)coldInletValue;
- (id)cold;

- (id)inletValue:(BSDInlet *)inlet;
- (id)getValueForInletNamed:(NSString *)inletName;

// Set inlet values
- (void)setHotInletValue:(id)value;
- (void)hot:(id)value;
- (void)setColdInletValue:(id)value;
- (void)cold:(id)value;

- (void)setValue:(id)value forInlet:(BSDInlet *)inlet;
- (void)setValue:(id)value forInletNamed:(NSString *)inletName;

// Get outlet value
- (id)getMainOutletValue;
- (id)getOutletValue:(NSString *)outletName;

// Calculate output value
- (id)calculateOutputValue;

// Send output value to main outlet
- (void)sendOutputValue:(id)value;
- (void)sendOutputValue:(id)value toOutletNamed:(NSString *)outletName;

// Connect to other Objects/Inlets
- (void)connect:(BSDObject *)object;
- (void)connectToHot:(BSDObject *)object;
- (void)connectToCold:(BSDObject *)object;

- (void)connectToInlet:(BSDInlet *)inlet;
- (void)disconnectFromInlet:(BSDInlet *)inlet;

- (void)connectToObject:(BSDObject *)object inletName:(NSString *)inletName;
- (void)connectOutletNamed:(NSString *)outletName toObject:(BSDObject *)object inletNamed:(NSString *)inletName;

- (void)addInlet:(BSDInlet *)inlet named:(NSString *)inletName;
- (void)addOutlet:(BSDOutlet *)outlet named:(NSString *)outletName;
- (BSDInlet *)getInletNamed:(NSString *)inletName;
- (BSDOutlet *)getOutletNamed:(NSString *)outletName;

- (BOOL)isEqual:(id)object;

@end
