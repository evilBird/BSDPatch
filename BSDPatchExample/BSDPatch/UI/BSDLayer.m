//
//  BSDLayer.m
//  BSDPatchExample
//
//  Created by Travis Henspeter on 8/5/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDLayer.h"

@implementation BSDLayer

- (instancetype)initWithCALayer:(CALayer *)layer
{
    return [super initWithArguments:layer];
}

- (void)setupWithArguments:(id)arguments
{
    self.name = @"Layer";
    self.getterInlet = [[BSDInlet alloc]init];
    self.getterInlet.name = @"getter inlet";
    self.getterInlet.hot = YES;
    [self addPort:self.getterInlet];
    self.getterOutlet = [[BSDOutlet alloc]init];
    self.getterOutlet.name = @"getter outlet";
    [self addPort:self.getterOutlet];
    CALayer *layer = arguments;
    if (layer) {
        self.layer = layer;
    }
    
}

- (void)hotInlet:(BSDInlet *)inlet receivedValue:(id)value
{
    if (inlet == self.hotInlet) {
        NSDictionary *hot = self.hotInlet.value;
        if (hot && self.layer) {
            for (NSString *aKey in hot.allKeys) {
                [self.layer setValue:hot[aKey] forKey:aKey];
            }
            
            self.mainOutlet.value = self.layer;
        }
        
    }else if (inlet == self.getterInlet){
        NSString *keyPath = inlet.value;
        self.getterOutlet.value = [self.layer valueForKeyPath:keyPath];
    }
}

@end
