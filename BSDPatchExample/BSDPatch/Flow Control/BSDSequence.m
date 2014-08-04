//
//  BSDSequence.m
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/15/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDSequence.h"

@implementation BSDSequence

- (instancetype)initWithNumberOfOutlets:(NSNumber *)numberOfOutlets
{
    return [super initWithArguments:numberOfOutlets];
}

- (instancetype)initAndConnectToInlets:(NSArray *)inlets
{
    return [super initWithArguments:inlets];
}

- (void)setupWithArguments:(id)arguments
{
    self.name = @"sequence";
    self.coldInlet.open = NO;
    if ([arguments isKindOfClass:[NSNumber class]]) {
        NSNumber *numberOfOutlets = arguments;
        for (NSUInteger i = 0; i < numberOfOutlets.integerValue; i++) {
            [self addOutlet];
        }
    }else if ([arguments isKindOfClass:[NSArray class]]){
        NSArray *inlets = arguments;
        for (BSDInlet *anInlet in inlets) {
            [self addOutletAndConnectToInlet:anInlet];
        }
    }
}

- (void)calculateOutput
{
    for (BSDOutlet *anOutlet in self.outlets) {
        anOutlet.value = self.hotInlet.value;
    }
}

//add outlets
- (BSDOutlet *)addOutlet
{
    NSUInteger numberOfOutlets = self.outlets.count;
    BSDOutlet *anOutlet = [[BSDOutlet alloc]init];
    anOutlet.name = [NSString stringWithFormat:@"%lu",(unsigned long)numberOfOutlets];
    [self addPort:anOutlet];
    
    return anOutlet;
}
- (BSDOutlet *)addOutletAndConnectToInlet:(BSDInlet *)inlet
{
    BSDOutlet *outlet = [self addOutlet];
    [outlet connectToInlet:inlet];
    return outlet;
}

- (BSDOutlet *)outletAtIndex:(NSNumber *)index
{
    //offset by 1 since we already have the main outlet
    NSUInteger i = index.integerValue + 1;
    NSString *outletName = [NSString stringWithFormat:@"%lu",(unsigned long)i];
    return [self outletNamed:outletName];
}

@end
