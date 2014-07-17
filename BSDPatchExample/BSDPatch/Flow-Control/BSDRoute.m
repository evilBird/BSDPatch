//
//  BSDRoute.m
//  BSDLang
//
//  Created by Travis Henspeter on 7/13/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDRoute.h"

@implementation BSDRoute

- (void)setupWithArguments:(id)arguments
{
    self.name = @"route";
    
    if ([arguments isKindOfClass:[NSArray class]]) {
        NSSet *selectors = [NSSet setWithArray:arguments];
        for (NSString *aSelector in selectors.allObjects) {
            BSDOutlet *outlet = [[BSDOutlet alloc]init];
            outlet.name = aSelector;
            [self addPort:outlet];
        }
    }
}

- (void)calculateOutput
{
    NSArray *inputArray = self.hotInlet.value;
    
    if ([inputArray respondsToSelector:@selector(objectAtIndex:)]
        && inputArray.count >= 2)
    {
        NSString *selector = inputArray.firstObject;
        BSDOutlet *outlet = [self outletNamed:selector];
        outlet.value = inputArray[1];
    }
}

@end
