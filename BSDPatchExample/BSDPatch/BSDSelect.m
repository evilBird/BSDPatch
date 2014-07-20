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

- (instancetype)initWithValues:(NSArray *)values inlets:(NSArray *)inlets
{
    NSDictionary *args = @{@"values": values,@"inlets":inlets};
    return [super initWithArguments:args];
}

- (void)setupWithArguments:(id)arguments
{
    self.name = @"select";
    NSDictionary *args = arguments;
    if (args) {
        NSArray *values = args[@"values"];
        NSArray *inlets = args[@"inlets"];
        if (values.count != inlets.count) {
            NSLog(@"\n\nBSDSelect ERROR\nNumber of values and inlets must match");
        }else{
            
            NSUInteger i = 0;
            for (id aVal in values) {
                NSString *key = [NSString stringWithFormat:@"%@",aVal];
                BSDOutlet *outlet = [[BSDOutlet alloc]init];
                outlet.name = key;
                [self addPort:outlet];
                BSDInlet *inlet = inlets[i];
                [self connectOutlet:outlet toInlet:inlet];
                i++;
            }
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
    BSDSelect *select = [[BSDSelect alloc]initWithValues:vals inlets:inlets];
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
