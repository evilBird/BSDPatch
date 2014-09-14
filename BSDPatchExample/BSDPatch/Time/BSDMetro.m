//
//  BSDMetro.m
//  VideoBlurExample
//
//  Created by Travis Henspeter on 8/13/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDMetro.h"
#import "BSDObjects.h"

@interface BSDMetro ()

@property (nonatomic,strong)BSDChange *stateChanged;

@end

@implementation BSDMetro

- (instancetype)initWithTimeInterval:(NSNumber *)timeInterval
{
    return [super initWithArguments:timeInterval];
}

- (void)setupWithArguments:(id)arguments
{
    self.name = @"metro";
    NSNumber *interval = arguments;
    if (interval) {
        self.coldInlet.value = interval;
    }
    
}

- (void)calculateOutput
{
    NSNumber *state = self.hotInlet.value;
    
    if (state.integerValue == 1 && !self.timer) {
        [self startTimer];
    }else if (state.integerValue == 0 && self.timer){
        [self stopTimer];
    }
}

- (void)startTimer
{
    NSNumber *interval = self.coldInlet.value;
    NSTimeInterval t = interval.doubleValue;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:t target:self selector:@selector(sendTimerBang) userInfo:nil repeats:YES];
    [self.timer fire];
}
                  
- (void)stopTimer
{
    [self.timer invalidate];
    self.timer = nil;
    self.mainOutlet.value = nil;
}
                  
- (void)sendTimerBang
{
    self.mainOutlet.value = [BSDBang bang];
}

@end
