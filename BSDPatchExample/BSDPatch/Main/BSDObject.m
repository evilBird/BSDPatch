//
//  BSDObject.m
//  BSDLang
//
//  Created by Travis Henspeter on 7/13/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDObject.h"

@implementation BSDObject

#pragma mark - Public
#pragma mark - Constructors

- (id)initWithArguments:(id)arguments
{
    self = [super init];
    if (self) {
        _name = @"BSDObject";
        _hotInlet = [[BSDInlet alloc]init];
        _hotInlet.name = @"hot";
        _hotInlet.objectId = [self objectId];
        _inlets = [NSMutableDictionary dictionary];
        [_hotInlet addObserver:self forKeyPath:@"value" options:NSKeyValueObservingOptionNew context:nil];
        [self addInlet:_hotInlet named:_hotInlet.name];
        _coldInlet = [[BSDInlet alloc]init];
        _coldInlet.name = @"cold";
        _coldInlet.objectId = [self objectId];
        [self addInlet:_coldInlet named:_coldInlet.name];
        _mainOutlet = [[BSDOutlet alloc]init];
        _mainOutlet.name = @"main";
        _mainOutlet.objectId = [self objectId];
        _outlets = [NSMutableDictionary dictionary];
        _activeOutletName = _mainOutlet.name;
        [self addOutlet:_mainOutlet named:_mainOutlet.name];
        [self setupWithArguments:arguments];
    }
    
    return self;
}

- (id)init
{
    return [self initWithArguments:nil];
}

- (NSString *)objectId
{
    return [NSString stringWithFormat:@"%p",self];
}

#pragma mark - Get inlet values

- (id)hotInletValue
{
    return self.hotInlet.value;
}
- (id)hot
{
    return self.hotInlet.value;
}

- (id)coldInletValue
{
    return self.coldInlet.value;
}

- (id)cold
{
    return self.coldInlet.value;
}

- (id)inletValue:(BSDInlet *)inlet
{
    return inlet.value;
}

- (id)valueForInletNamed:(NSString *)inletName
{
    if ([self.inlets.allKeys containsObject:inletName]) {
        BSDInlet *inlet = self.inlets[inletName];
        return inlet.value;
    }
    
    return nil;
}

#pragma mark - Set inlet values

- (void)setHotInletValue:(id)value
{
    [self.hotInlet input:value];
}

- (void)hot:(id)value
{
    [self.hotInlet input:value];
}
- (void)cold:(id)value
{
    [self.coldInlet input:value];
}

- (void)setColdInletValue:(id)value
{
    [self.coldInlet input:value];
}

- (void)setValue:(id)value forInlet:(BSDInlet *)inlet
{
    if (inlet == self.hotInlet) {
        
        [self setHotInletValue:value];
        
    }else if (inlet == self.coldInlet)
    {
        [self setColdInletValue:value];
    }else if ([self.inlets.allValues containsObject:inlet])
    {
        [inlet input:value];
    }
}

- (void)setValue:(id)value forInletNamed:(NSString *)inletName
{
    if ([self.inlets.allKeys containsObject:inletName]) {
        BSDInlet *inlet = self.inlets[inletName];
        [self setValue:value forInlet:inlet];
    }
}

#pragma mark - get main outlet value

- (id)getMainOutletValue
{
    return self.mainOutlet.value;
}

- (id)getOutletValue:(NSString *)outletName
{
    if ([self.outlets.allKeys containsObject:outletName]) {
        BSDOutlet *outlet = self.outlets[outletName];
        return outlet.value;
    }
    return nil;
}

#pragma mark - overrides

- (void)setupWithArguments:(id)arguments
{
    //optionally configure your processing chain
    
}

- (id)calculateOutputValue
{
    // override
    return nil;
}

#pragma mark - BSDObjectOutputUser

- (void)BSDObject:(BSDObject *)object sentOutputValue:(id)value
{
    //Optionally take messages from another object
}

- (void)BSDObject:(BSDObject *)object outlet:(BSDOutlet *)outlet sentOutputValue:(id)value
{
    //As above, but specifying an outlet other than the main
}

- (void)sendOutputValue:(id)value
{
    [self sendOutputValue:value toOutletNamed:@"main"];
}

- (void)sendOutputValue:(id)value toOutletNamed:(NSString *)outletName
{
    if (value != NULL && [self.outlets.allKeys containsObject:outletName]) {
        BSDOutlet *outlet = self.outlets[outletName];
        [outlet sendValue:value];
        if (self.outputUser) {
            [self.outputUser BSDObject:self outlet:outlet sentOutputValue:value];
        }
    }
}

#pragma mark - Connect to other objects/inlets

- (void)connectToHot:(BSDObject *)object
{
    [self.mainOutlet connectInlet:object.hotInlet];
}

- (void)connectToCold:(BSDObject *)object
{
    [self.mainOutlet connectInlet:object.coldInlet];
}

//Manage connections with specific inlets

- (void)connect:(BSDInlet *)inlet
{
    [self.mainOutlet connectInlet:inlet];
}

- (void)disconnect:(BSDInlet *)inlet
{
    [self.mainOutlet disconnectInlet:inlet];
}

- (void)connectToObject:(BSDObject *)object inletName:(NSString *)inletName
{
    [self connectOutletNamed:nil toObject:object inletNamed:inletName];
}

- (void)connectOutletNamed:(NSString *)outletName toObject:(BSDObject *)object inletNamed:(NSString *)inletName
{
    BSDInlet *inlet = [object getInletNamed:inletName];
    if (inlet) {
        if (outletName) {
            BSDOutlet *outlet = [self getOutletNamed:outletName];
            if (outlet) {
                [outlet connectInlet:inlet];
            }
        }else{
            [self.mainOutlet connectInlet:inlet];
        }
    }
}

//Manage internal inlets/outlets
- (void)addInlet:(BSDInlet *)inlet named:(NSString *)inletName
{
    if (inlet && inletName) {
        self.inlets[inletName] = inlet;
    }
}

- (void)addOutlet:(BSDOutlet *)outlet named:(NSString *)outletName
{
    if (outlet && outletName) {
        self.outlets[outletName] = outlet;
    }
}
- (BSDInlet *)getInletNamed:(NSString *)inletName
{
    if ([self.inlets.allKeys containsObject:inletName]) {
        return self.inlets[inletName];
    }
    
    return nil;
}

- (BSDOutlet *)getOutletNamed:(NSString *)outletName
{
    if ([self.outlets.allKeys containsObject:outletName]) {
        return self.outlets[outletName];
    }
    
    return nil;
}


- (BOOL)isEqual:(id)object
{
    if ([object isKindOfClass:[BSDObject class]]) {
        if ([[object objectId] isEqualToString:[self objectId]]) {
            return YES;
        }
    }
    
    return NO;
}

#pragma mark - Private
#pragma mark - KVO

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    /*
    if ([keyPath isEqualToString:keyPath]) {
        [self sendOutputValue:[self calculateOutputValue]];
    }
     */
    if ([keyPath isEqualToString:keyPath]) {

        [self sendOutputValue:[self calculateOutputValue] toOutletNamed:self.activeOutletName];
    }
}

@end
