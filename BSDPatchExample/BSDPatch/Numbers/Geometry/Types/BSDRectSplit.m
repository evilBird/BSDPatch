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

- (instancetype)initWithCGRect:(CGRect)rect
{
    return [super initWithArguments:[NSValue wrapRect:rect]];
}


- (void)setupWithArguments:(id)arguments
{
    self.name = @"rect split";
    self.originXOutlet = [[BSDOutlet alloc]init];
    self.originXOutlet.name = @"origin X";
    self.originXOutlet.value = @0;
    [self addPort:self.originXOutlet];
    
    self.originYOutlet = [[BSDOutlet alloc]init];
    self.originYOutlet.name = @"origin Y";
    self.originYOutlet.value = @0;
    [self addPort:self.originYOutlet];
    
    self.widthOutlet = [[BSDOutlet alloc]init];
    self.widthOutlet.name = @"width";
    self.widthOutlet.value = @0;
    [self addPort:self.widthOutlet];
    
    self.heightOutlet = [[BSDOutlet alloc]init];
    self.heightOutlet.name = @"height";
    self.heightOutlet.value = @0;
    [self addPort:self.heightOutlet];
    
    NSValue *initialRect = arguments;
    if (initialRect) {
        self.coldInlet.value = initialRect;
    }
    
}

- (void)calculateOutput
{
    NSValue *hot = self.hotInlet.value;
    NSValue *cold = self.coldInlet.value;
    if (!hot) {
        hot = cold;
    }
    CGRect rect = hot.CGRectValue;
    self.heightOutlet.value = @(rect.size.height);
    self.widthOutlet.value = @(rect.size.width);
    self.originYOutlet.value = @(rect.origin.y);
    self.originXOutlet.value = @(rect.origin.x);
    self.coldInlet.value = [NSValue wrapRect:rect];
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
