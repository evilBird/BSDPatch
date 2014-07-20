//
//  BSDRoute.m
//  BSDLang
//
//  Created by Travis Henspeter on 7/13/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDRoute.h"

@implementation BSDRoute

- (instancetype)initWithKeys:(NSArray *)keys forInlets:(NSArray *)inlets
{
    if (keys.count != inlets.count) {
        return [super initWithArguments:nil];
    }else{
        NSUInteger i = 0;
        NSMutableDictionary *args = [NSMutableDictionary dictionary];
        for (NSString *aKey in keys) {
            args[aKey] = inlets[i];
            i++;
        }
        
        return [super initWithArguments:args];
    }
}

- (void)setupWithArguments:(id)arguments
{
    self.name = @"route";
    if ([arguments isKindOfClass:[NSArray class]]) {
        for (NSString *aSelector in arguments) {
            BSDOutlet *outlet = [[BSDOutlet alloc]init];
            outlet.name = aSelector;
            [self addPort:outlet];
        }
    }else if ([arguments isKindOfClass:[NSDictionary class]]){
        NSDictionary *args = (NSDictionary *)arguments;
        NSUInteger i = 0;
        for (NSString *aKey in args.allKeys) {
            BSDOutlet *outlet = [[BSDOutlet alloc]init];
            outlet.name = aKey;
            [self addPort:outlet];
            [outlet connectInlet:args.allValues[i]];
            i++;
        }
        
    }
}

- (void)calculateOutput
{
    
    NSArray *inputArray = self.hotInlet.value;
    
    if (inputArray && [inputArray isKindOfClass:[NSArray class]]) {
        if (inputArray.count >=2) {
            NSString *selector = inputArray.firstObject;
            BSDOutlet *outlet = [self outletNamed:selector];
            outlet.value = inputArray[1];
        }
    }else{
        
        NSDictionary *inputDictionary = self.hotInlet.value;
        
        if (inputDictionary && [inputDictionary isKindOfClass:[NSDictionary class]]) {
            NSString *selector = inputDictionary.allKeys.firstObject;
            id value = inputDictionary[selector];
            [[self outletNamed:selector]setValue:value];
        }

    }
    
    
}

@end
