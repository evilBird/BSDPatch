//
//  BSDArrayMake.m
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/20/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDArrayMake.h"
#import "BSDCreate.h"

@interface BSDArrayMake ()

@property (nonatomic,strong)NSArray *pairedInletNames;

@end

@implementation BSDArrayMake

- (instancetype)initWithOutlets:(NSArray *)outlets
{
    return [super initWithArguments:outlets];
}

- (void)setupWithArguments:(id)arguments
{
    self.name = @"array compose";
    NSArray *outlets = arguments;
    if (outlets) {
        NSMutableArray *names = [NSMutableArray array];
        NSUInteger i = 0;
        for (id anOutlet in outlets) {
            BSDInlet *inlet = [[BSDInlet alloc]initHot];
            inlet.name = [NSString stringWithFormat:@"paired_inlet_%lu",(unsigned long)i];
            [names addObject:inlet.name];
            if ([anOutlet isKindOfClass:[BSDOutlet class]]) {
                [inlet observePort:anOutlet];
            }else{
                inlet.value = anOutlet;
            }
            [self addPort:inlet];
            i++;
        }
        self.pairedInletNames = names;
    }
}

- (void)calculateOutput
{
    NSMutableArray *arr = [NSMutableArray array];
    for (NSString *aName in self.pairedInletNames) {
        BSDInlet *inlet = [self inletNamed:aName];
        if (inlet.value != NULL){[arr addObject:inlet.value];};
    }
    
    if (arr && arr.count == self.pairedInletNames.count) {
        self.mainOutlet.value = arr;
    }
}

- (void)test
{
    BSDValueBox *box1 = [BSDCreate valueBoxCold:@(1)];
    BSDValueBox *box2 = [BSDCreate valueBoxCold:@(100)];
    BSDValueBox *box3 = [BSDCreate valueBoxCold:@(1000)];
    [self setupWithArguments:@[@"not an outlet",box1.mainOutlet,box2.mainOutlet,box3.mainOutlet]];
    self.outputBlock = ^(BSDObject *object, BSDOutlet *outlet){
        NSLog(@"composed array: %@",outlet.value);
    };
    
    NSLog(@"will bang box 2");
    [box2.hotInlet input:[BSDBang bang]];
    NSLog(@"will bang box 1");
    [box1.hotInlet input:[BSDBang bang]];
    NSLog(@"will bang box 3");
    [box3.hotInlet input:[BSDBang bang]];
    NSLog(@"will change box 1 value to 10");
    [box1.coldInlet input:@(10)];
    NSLog(@"will bang box 1");
    [box1.hotInlet input:[BSDBang bang]];
}

@end
