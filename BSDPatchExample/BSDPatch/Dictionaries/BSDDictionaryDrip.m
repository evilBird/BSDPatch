//
//  BSDDictionaryDrip.m
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/20/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDDictionaryDrip.h"
#import "BSDCreate.h"

@implementation BSDDictionaryDrip

- (void)setupWithArguments:(id)arguments
{
    self.name = @"dictionary drip";
}

- (void)calculateOutput
{
    NSDictionary *dictionary = self.hotInlet.value;
    if (dictionary && [dictionary isKindOfClass:[NSDictionary class]]) {
        for (id aKey in dictionary.allKeys) {
            self.mainOutlet.value = @{aKey: dictionary[aKey]};
        }
    }
}

- (void)test
{
    self.outputBlock = ^(BSDObject *object,BSDOutlet *outlet){
        
        NSLog(@"emitted output %@",outlet.value);
        
    };
    
    NSDictionary *testDict = @{@"do": @"deer",@"re":@"drop of sun",@"mi":@"name",@"fa":@"long run"};
    [self.hotInlet input:testDict];
}

@end
