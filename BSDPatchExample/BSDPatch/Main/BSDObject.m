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

- (instancetype)initWithArguments:(id)arguments
{
    self = [super init];
    if (self) {
        
        _observedPorts = [NSMutableSet set];
        _inlets = [NSMutableArray array];
        _outlets = [NSMutableArray array];
        
        _name = @"BSDObject";
        _hotInlet = [[BSDInlet alloc]initHot];
        _hotInlet.name = @"hot";
        _hotInlet.objectId = [self objectId];
        [self addPort:_hotInlet];

        _coldInlet = [[BSDInlet alloc]initCold];
        _coldInlet.name = @"cold";
        _coldInlet.objectId = [self objectId];
        [self addPort:_coldInlet];
        
        _mainOutlet = [[BSDOutlet alloc]init];
        _mainOutlet.name = @"main";
        _mainOutlet.objectId = [self objectId];
        [self addPort:_mainOutlet];

        [self setupWithArguments:arguments];
    }
    
    return self;
}

- (instancetype)init
{
    return [self initWithArguments:nil];
}

- (void)setOutputBlock:(BSDObjectOutputBlock)outputBlock
{
    self.mainOutlet.outputBlock = outputBlock;
}

#pragma mark - overrides

- (void)setupWithArguments:(id)arguments
{
    //override to configure before processing
}

- (void)calculateOutput
{
    //override
}

#pragma mark - Connect to other objects/inlets
//Manage connections with specific inlets
- (void)connect:(BSDInlet *)inlet
{
    [self.mainOutlet connectInlet:inlet];
}

- (void)disconnect:(BSDInlet *)inlet
{
    [self.mainOutlet disconnectInlet:inlet];
}

- (void) connectOutlet:(BSDOutlet *)outlet toInlet:(BSDInlet *)inlet
{
    [outlet connectInlet:inlet];
}

- (void)connectOutletNamed:(NSString *)outletName toObject:(BSDObject *)object inletNamed:(NSString *)inletName
{
    BSDInlet *inlet = [object inletNamed:inletName];
    if (inlet) {
        if (outletName) {
            BSDOutlet *outlet = [self outletNamed:outletName];
            if (outlet) {
                [outlet connectInlet:inlet];
            }
        }else{
            [self.mainOutlet connectInlet:inlet];
        }
    }
}

//Manage ports
- (void)addPort:(BSDPort *)port
{
    if (port && port.name) {
        if ([port isKindOfClass:[BSDInlet class]]) {
            BSDInlet *inlet = (BSDInlet *)port;
            [self.inlets addObject:inlet];
            if (inlet.isHot) {
                [self observePort:inlet];
            }
        } else if ([port isKindOfClass:[BSDOutlet class]]){
            BSDOutlet *outlet = (BSDOutlet *)port;
            [self.outlets addObject:outlet];
            [self observePort:outlet];
        }
    }
}

- (BSDInlet *) inletNamed:(NSString *)name
{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name == %@",name];
    NSArray *matches = [self.inlets filteredArrayUsingPredicate:predicate];
    if (!matches) {
        return nil;
    }
    if (matches.count == 1) {
        return matches.firstObject;
    }
    
    if (matches.count > 1) {
        NSLog(@"error: multiple inlets named %@: %@",name,matches);
        return nil;
    }
    
    return nil;
}

- (BSDOutlet *) outletNamed:(NSString *)name
{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name == %@",name];
    NSArray *matches = [self.outlets filteredArrayUsingPredicate:predicate];
    if (!matches) {
        return nil;
    }
    if (matches.count == 1) {
        return matches.firstObject;
    }
    
    if (matches.count > 1) {
        NSLog(@"error: multiple outlets named %@: %@",name,matches);
        return nil;
    }
    
    return nil;
}

// Unique object identifier & equality

- (NSString *)objectId
{
    return [NSString stringWithFormat:@"%p",self];
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

- (void)observePort:(BSDPort *)port
{
    [port addObserver:self forKeyPath:@"value" options:NSKeyValueObservingOptionNew context:nil];
    [self.observedPorts addObject:port];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"value"]) {
        //handle data emitted from hot inlet(s)
        if ([object isKindOfClass:[BSDInlet class]]) {
            [self calculateOutput];
        }else if ([object isKindOfClass:[BSDOutlet class]]){
            //handle changes in outlet value
            BSDOutlet *outlet = (BSDOutlet *)object;
            if (outlet.outputBlock != NULL) {
                __weak BSDObject *WEAK_SELF = self;
                outlet.outputBlock(WEAK_SELF,outlet);
            }
        }
    }
}

- (void)dealloc
{
    if (self.observedPorts.count) {
        
        for (BSDPort *port in self.observedPorts) {
            [port removeObserver:self forKeyPath:@"value" context:nil];
        }
    }
    self.observedPorts = nil;
    self.hotInlet = nil;
    self.coldInlet = nil;
    self.inlets = nil;
    self.outlets = nil;
    
}

@end
