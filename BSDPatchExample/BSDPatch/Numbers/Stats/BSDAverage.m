//
//  BSDAverage.m
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/14/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDAverage.h"
#import "BSDCreate.h"

@interface BSDAverage ()

@property (nonatomic) NSUInteger count;
@property (nonatomic) NSUInteger bufferSize;
@property (nonatomic) double runningSum;

@end

@implementation BSDAverage

- (instancetype)initWithBufferSize:(NSNumber *)bufferSize;
{
    return [super initWithArguments:bufferSize];
}

- (void)setupWithArguments:(id)arguments
{
    
    self.name = @"average";
    NSNumber *bufferSize = (NSNumber *)arguments;
    
    self.countOutlet = [[BSDOutlet alloc]init];
    self.countOutlet.name = @"count";
    self.countOutlet.value = @(0);
    
    if (bufferSize) {
        _bufferSize = bufferSize.integerValue;
        BSDBuffer *buffer = [[BSDBuffer alloc]initWithBufferSize:bufferSize];
        self.coldInlet.value = buffer;
    }else{
        _bufferSize = 0;
        self.coldInlet.value = @0;
    }
    
    self.count = 0;
}

- (void)inletReceievedBang:(BSDInlet *)inlet
{
    if (inlet == self.hotInlet) {
        [self reset];
        [self calculateOutput];
    }
}

- (void)reset
{
    BSDBuffer *buffer = self.coldInlet.value;
    if ([buffer isKindOfClass:[BSDBuffer class]]) {
        [buffer.hotInlet input:[BSDBang bang]];
    }else{
        self.count = 0;
        self.coldInlet.value  = @0;
    }
}

- (void)calculateOutput
{
    NSNumber *hot = self.hotInlet.value;
    BSDBuffer *buffer = self.coldInlet.value;
    if (self.bufferSize > 0) {
        [buffer.hotInlet input:hot];
        NSArray *updatedBuffer = buffer.mainOutlet.value;
        NSNumber *avg = [updatedBuffer valueForKeyPath:@"@avg.self"];
        self.countOutlet.value = @(updatedBuffer.count);
        self.mainOutlet.value = avg;
        
    }else{
        double currentSum = [self.coldInlet.value floatValue];
        currentSum += hot.floatValue;
        self.count ++;
        self.countOutlet.value = @(self.count);
        self.mainOutlet.value = @(currentSum/(double)self.count);
    }

}


@end
