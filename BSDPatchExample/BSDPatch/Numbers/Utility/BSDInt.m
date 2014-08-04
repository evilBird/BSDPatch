//
//  BSDInt.m
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/20/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDInt.h"

@implementation BSDInt

- (void)setupWithArguments:(id)arguments
{
    self.name = @"int";
    self.coldInlet.open = NO;
}

-(void)calculateOutput
{
    NSNumber *hot = self.hotInlet.value;
    self.mainOutlet.value = @((NSInteger)hot.doubleValue);
}

- (void)test
{
    self.outputBlock = ^(BSDObject *object, BSDOutlet *outlet){
        NSLog(@"int returned value %@",outlet.value);
    };
    
    NSLog(@"will send %@ to int object",@(1.6));
    [self.hotInlet input:@(1.6)];
}

@end
