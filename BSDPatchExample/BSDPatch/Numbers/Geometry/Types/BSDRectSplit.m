//
//  BSDRectSplit.m
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/20/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDRectSplit.h"
#import "BSDCreate.h"

@implementation BSDRectSplit

- (void)setupWithArguments:(id)arguments
{
    self.name = @"rect split";
    self.originXOutlet = [[BSDOutlet alloc]init];
    self.originXOutlet.name = @"origin X";
    [self addPort:self.originXOutlet];
    self.originYOutlet = [[BSDOutlet alloc]init];
    self.originYOutlet.name = @"origin Y";
    [self addPort:self.originYOutlet];
    self.widthOutlet = [[BSDOutlet alloc]init];
    self.widthOutlet.name = @"width";
    [self addPort:self.widthOutlet];
    self.heightOutlet = [[BSDOutlet alloc]init];
    self.heightOutlet.name = @"height";
    [self addPort:self.heightOutlet];
}

- (void)calculateOutput
{
    NSValue *hot = self.hotInlet.value;
    if (hot) {
        CGRect rect = hot.CGRectValue;
        self.heightOutlet.value = @(rect.size.height);
        self.widthOutlet.value = @(rect.size.width);
        self.originYOutlet.value = @(rect.origin.y);
        self.originXOutlet.value = @(rect.origin.x);
    }
}

- (void)test
{
    self.heightOutlet.outputBlock = ^(BSDObject *object, BSDOutlet *outlet){
        NSLog(@"outlet %@ emitted value %@",outlet.name,outlet.value);
    };
    self.widthOutlet.outputBlock = ^(BSDObject *object, BSDOutlet *outlet){
        NSLog(@"outlet %@ emitted value %@",outlet.name,outlet.value);
    };
    self.originYOutlet.outputBlock = ^(BSDObject *object, BSDOutlet *outlet){
        NSLog(@"outlet %@ emitted value %@",outlet.name,outlet.value);
    };
    self.originXOutlet.outputBlock = ^(BSDObject *object, BSDOutlet *outlet){
        NSLog(@"outlet %@ emitted value %@",outlet.name,outlet.value);
    };
    
    CGRect rect;rect.origin.x = 10;rect.origin.y = 100;rect.size.width = 300;rect.size.height = 200;
    [self.hotInlet input:[NSValue wrapRect:rect]];
}

@end
