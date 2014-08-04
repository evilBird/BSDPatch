//
//  BSDArrayMake.m
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/20/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDArrayPack.h"
#import "BSDCreate.h"

@interface BSDArrayPack ()

@property (nonatomic,strong)NSArray *pairedInletNames;

@end

@implementation BSDArrayPack

- (instancetype)initWithNumberOfInlets:(NSNumber *)numberOfInlets
{
    return [super initWithArguments:numberOfInlets];
}
- (instancetype)initAndConnectToOutlets:(NSArray *)outlets
{
    return [super initWithArguments:outlets];
}

- (void)setupWithArguments:(id)arguments
{
    self.name = @"array pack";
    self.coldInlet.open = NO;
    
    if ([arguments isKindOfClass:[NSNumber class]]) {
        NSNumber *numberOfInlets = arguments;
        for (NSUInteger idx = 0; idx < numberOfInlets.integerValue; idx ++) {
            [self addInlet];
        }
    }else if ([arguments isKindOfClass:[NSArray class]]){
        NSArray *outlets = arguments;
        for (BSDOutlet *anOutlet in outlets) {
            [self addInletAndConnectToOutlet:anOutlet];
        }
    }
}

- (void)inletReceievedBang:(BSDInlet *)inlet
{
    if (inlet == self.hotInlet) {
        NSUInteger numberOfInlets = self.inlets.count - 2;
        NSMutableArray *outputArray = [[NSMutableArray alloc]initWithCapacity:numberOfInlets];
        for (NSUInteger idx = 0; idx < numberOfInlets; idx ++) {
            id value = [self inletAtIndex:@(idx)];
            if (value != NULL) {
                [outputArray addObject:[NSNull null]];
            }else{
                [outputArray addObject:value];
            }
        }
        
        self.mainOutlet.value = outputArray;
    }
}

- (BSDInlet *)inletAtIndex:(NSNumber *)index
{
    //offset index by 2 since we already have the hot and cold inlets
    NSUInteger i = index.integerValue + 2;
    NSString *inletName = [NSString stringWithFormat:@"%lu",(unsigned long)i];
    return [self inletNamed:inletName];
}

- (BSDInlet *)addInlet
{
    BSDInlet *inlet = [[BSDInlet alloc]init];
    inlet.name = [NSString stringWithFormat:@"%lu",(unsigned long)self.inlets.count];
    [self addPort:inlet];
    return inlet;
}

- (BSDInlet *)addInletAndConnectToOutlet:(BSDOutlet *)outlet
{
    BSDInlet *inlet = [self addInlet];
    [outlet connectToInlet:inlet];
    return inlet;
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
