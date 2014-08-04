//
//  BSDSelect.m
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/20/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDSelect.h"
#import "BSDCreate.h"

@implementation BSDSelect

- (instancetype)initWithSelectors:(NSArray *)selectors
{
    return [super initWithArguments:selectors];
}

- (instancetype)initAndConnectWithSelectorsAndInlets:(NSDictionary *)selectorsAndInlets
{
    return [super initWithArguments:selectorsAndInlets];
}

- (void)setupWithArguments:(id)arguments
{
    self.name = @"select";
    self.coldInlet.open = NO;
    
    if ([arguments isKindOfClass:[NSArray class]]) {
        NSArray *selectors = arguments;
        for (id aSelector in selectors) {
            [self addOutletForSelector:aSelector];
        }
        
    }else if ([arguments isKindOfClass:[NSDictionary class]]){
        NSDictionary *selectorsAndInlets = arguments;
        for (id aSelector in selectorsAndInlets.allKeys) {
            BSDInlet *inlet = selectorsAndInlets[aSelector];
            [self addOutletForSelector:aSelector connectToInlet:inlet];
        }
    }
}

- (void)calculateOutput
{
    id hot = self.hotInlet.value;
    NSString *key = [NSString stringWithFormat:@"%@",hot];
    BSDOutlet *outlet = [self outletNamed:key];
    if (outlet != nil) {
        outlet.value = [BSDBang bang];
    }
    
    self.mainOutlet.value = hot;
}

//create an additional outlet for the specified selector
- (BSDOutlet *)addOutletForSelector:(id)selector
{
    BSDOutlet *outlet = [[BSDOutlet alloc]init];
    outlet.name = [NSString stringWithFormat:@"%@",selector];
    [self addPort:outlet];
    return outlet;
}
- (BSDOutlet *)addOutletForSelector:(id)selector connectToInlet:(BSDInlet *)inlet
{
    BSDOutlet *outlet = [self addOutletForSelector:selector];
    [outlet connectToInlet:inlet];
    return outlet;
}

- (BSDOutlet *)outletForSelector:(id)selector
{
    NSString *outletName = [NSString stringWithFormat:@"%@",selector];
    return [self outletNamed:outletName];
}

- (void)test
{
    BSDValueBox *box1 = [BSDCreate valueBoxCold:@(10)];
    box1.outputBlock = ^(BSDObject *object, BSDOutlet *outlet){
        NSLog(@"box 1 emitted value %@",outlet.value);
    };
    BSDValueBox *box2 = [BSDCreate valueBoxCold:@(100)];
    box2.outputBlock = ^(BSDObject *object, BSDOutlet *outlet){
        NSLog(@"box 2 emitted value %@",outlet.value);
    };
    BSDValueBox *box3 = [BSDCreate valueBoxCold:@(1000)];
    box3.outputBlock = ^(BSDObject *object, BSDOutlet *outlet){
        NSLog(@"box 3 emitted value %@",outlet.value);
    };
    
    NSArray *vals = @[@(0),@(1),@(2)];
    NSArray *inlets = @[box1.hotInlet,box2.hotInlet,box3.hotInlet];
    BSDSelect *select = [[BSDSelect alloc]initAndConnectWithSelectorsAndInlets:@{vals[0]:inlets[0],
                                                                                 vals[1]:inlets[1],
                                                                                 vals[2]:inlets[2]
                                                                                 }];
    [select.hotInlet input:@(2)];
    NSLog(@"select in: %@",select.hotInlet.value);
    [select.hotInlet input:@(1)];
    NSLog(@"select in: %@",select.hotInlet.value);
    [select.hotInlet input:@(0)];
    NSLog(@"select in: %@",select.hotInlet.value);
    [select.hotInlet input:@(4)];
    NSLog(@"select in: %@",select.hotInlet.value);
    [select.hotInlet input:@(-1)];
    NSLog(@"select in: %@",select.hotInlet.value);
}

@end
