//
//  BSDDictionaryDrip.m
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/20/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDDictionarySerialize.h"
#import "BSDCreate.h"

@implementation BSDDictionarySerialize

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    return [super initWithArguments:dictionary];
}

- (void)setupWithArguments:(id)arguments
{
    self.name = @"dictionary serialize";
    NSDictionary *dictionary = arguments;
    if (dictionary) {
        self.coldInlet.value = dictionary;
    }
    
    self.doneOutlet = [[BSDOutlet alloc]init];
    self.doneOutlet.name = @"done";
    [self addPort:self.doneOutlet];
}

- (void)inletReceievedBang:(BSDInlet *)inlet
{
    if (inlet == self.hotInlet) {
        NSDictionary *dictionary = self.hotInlet.value;
        if (dictionary && [dictionary isKindOfClass:[NSDictionary class]]) {
            for (id aKey in dictionary.allKeys) {
                self.mainOutlet.value = @{aKey: dictionary[aKey]};
            }
        }
        
        self.doneOutlet.value = [BSDBang bang];
    }
}

- (void)test
{
    self.outputBlock = ^(BSDObject *object,BSDOutlet *outlet){
        
        NSLog(@"emitted output %@",outlet.value);
        
    };
    
    NSDictionary *testDict = @{@"do": @"deer",@"re":@"drop of sun",@"mi":@"name",@"fa":@"long run"};
    self.coldInlet.value = testDict;
    [self.hotInlet input:[BSDBang bang]];
}

@end
