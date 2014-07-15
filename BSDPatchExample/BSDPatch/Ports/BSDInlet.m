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

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([object isKindOfClass:[BSDOutlet class]]) {
        [self input:[(BSDOutlet *)object value]];
    }
}

@end
