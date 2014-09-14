//
//  BSDSpeedLimit.m
//  BSDPatchExample
//
//  Created by Travis Henspeter on 8/5/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDSpeedLimit.h"

@implementation BSDSpeedLimit

- (instancetype)initWithInterval:(NSNumber *)interval
{
    return [super initWithArguments:interval];
}

- (void)setupWithArguments:(id)arguments
{
    self.name = @"speed limit";
    NSNumber *interval = arguments;
    self.coldInlet.value = @(1);
    if (interval) {
        self.coldInlet.value = interval;
    }
    self.ready = YES;
}

- (void)hotInlet:(BSDInlet *)inlet receivedValue:(id)value
{
    if (self.isReady) {
        self.ready = NO;
        self.mainOutlet.value = self.hotInlet.value;
        NSNumber *interval = self.coldInlet.value;
        [NSTimer scheduledTimerWithTimeInterval:interval.floatValue target:self selector:@selector(openInlet) userInfo:nil repeats:NO];
    }
}

- (void)openInlet
{
    self.ready = YES;
}

- (void)test
{
    self.coldInlet.value = @(2.0);
    self.outputBlock = ^(BSDObject *object, BSDOutlet *outlet){
        NSLog(@"test with input value %@ produced output value %@",object.hotInlet.value,outlet.value);
    };
    
    [self performSelector:@selector(sendTestSignal) withObject:nil afterDelay:0];
    [self performSelector:@selector(sendTestSignal) withObject:nil afterDelay:0.2];
    [self performSelector:@selector(sendTestSignal) withObject:nil afterDelay:0.4];
    [self performSelector:@selector(sendTestSignal) withObject:nil afterDelay:1.2];
    [self performSelector:@selector(sendTestSignal) withObject:nil afterDelay:1.6];
    [self performSelector:@selector(sendTestSignal) withObject:nil afterDelay:1.9];
    [self performSelector:@selector(sendTestSignal) withObject:nil afterDelay:2.8];
    
}

- (void)sendTestSignal
{
    static NSInteger testValue;
    testValue+=1;
    NSLog(@"sending test value %@",@(testValue));
    [self.hotInlet input:@(testValue)];
}

@end
