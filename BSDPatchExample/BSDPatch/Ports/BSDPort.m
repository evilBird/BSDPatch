//
//  BSDPort.m
//  BSDLang
//
//  Created by Travis Henspeter on 7/13/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDPort.h"

@implementation BSDPort

- (instancetype)init
{
    self = [super init];
    if (self) {
        _open = YES;
    }
    
    return self;
}

- (NSString *)portId
{
    return [NSString stringWithFormat:@"%p",self];
}

- (void)observePort:(BSDPort *)port
{
    if (!self.observedPorts) {
        self.observedPorts = [NSMutableSet set];
    }
    
    if (![self.observedPorts containsObject:port]) {
        [port addObserver:self forKeyPath:@"value" options:NSKeyValueObservingOptionNew context:nil];
        [self.observedPorts addObject:port];
    }
}

- (void)stopObservingPort:(BSDPort *)port
{
    if (self.observedPorts && [self.observedPorts containsObject:port]) {
        [port removeObserver:self forKeyPath:@"value"];
        [self.observedPorts removeObject:port];
    }
}

- (void)forwardToPort:(BSDPort *)port
{
    [port observePort:self];
}

- (void)removeForwardPort:(BSDPort *)port
{
    [port stopObservingPort:self];
}

- (void)dealloc
{
    if (self.observedPorts) {
        for (BSDPort *port in self.observedPorts) {
            [port removeObserver:self forKeyPath:@"value"];
        }
    }
    
    self.observedPorts = nil;
    self.delegate = nil;
}

@end
