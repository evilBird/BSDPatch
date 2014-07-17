//
//  BSDInlet.m
//  BSDLang
//
//  Created by Travis Henspeter on 7/12/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDInlet.h"
#import "BSDOutlet.h"


@implementation BSDInlet

- (void)bang
{
    [self input:self.value];
}

- (void)input:(id)input;
{
    self.value = input;
}

- (void)forwardInputToInlet:(BSDInlet *)inlet
{
    if (!self.forwardInlets) {
        self.forwardInlets = [NSMutableArray array];
    }
    [self.forwardInlets addObject:inlet];
    [self addObserver:inlet forKeyPath:@"value" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([object isKindOfClass:[BSDOutlet class]] || [object isKindOfClass:[BSDInlet class]]) {
        [self input:[(BSDOutlet *)object value]];
    }
}

- (void)dealloc
{
    if (self.forwardInlets) {
        for (BSDInlet *inlet in self.forwardInlets) {
            [inlet removeObserver:self forKeyPath:@"value" context:nil];
        }
        
        self.forwardInlets = nil;
    }
}

@end
