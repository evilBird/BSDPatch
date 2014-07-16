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

@property (nonatomic,strong)BSDAccum *accum;
@property (nonatomic,strong)BSDCounter *counter;
@property (nonatomic,strong)BSDDivide *divide;
@property (nonatomic)NSUInteger bufferSize;
@property (nonatomic,strong)NSMutableArray *inputBuffer;

@end

@implementation BSDAverage

- (id)initWithBufferSize:(NSUInteger)bufferSize
{
    return [super initWithArguments:@(bufferSize)];
}

- (void)setupWithArguments:(id)arguments
{
    NSNumber *bufferSize = (NSNumber *)arguments;
    
    if (bufferSize) {
        _bufferSize = bufferSize.integerValue;
        self.inputBuffer = [NSMutableArray array];
        self.name = [NSString stringWithFormat:@"running average (n=%@)",bufferSize];
    }else{
        self.name = @"average";
    }
    
    self.accum = [BSDCreate accumulate];
    self.counter = [BSDCreate counter];
    self.divide = [BSDCreate divide];
    [self.accum connectToHot:self.divide];
    [self.counter connectToCold:self.divide];
}

- (id)addBufferValue:(id)value
{
    if (value != NULL && self.inputBuffer) {
        
        if (self.inputBuffer.count == 0) {
            [self.inputBuffer addObject:value];
        }else if (self.inputBuffer.count < self.bufferSize){
            [self.inputBuffer insertObject:value atIndex:0];
        }else{
            [self.inputBuffer insertObject:value atIndex:0];
            id oldestValue = self.inputBuffer.lastObject;
            [self.inputBuffer removeObjectAtIndex:(self.inputBuffer.count - 1)];
            return oldestValue;
        }
        
    }
    
    return NULL;
}

- (void)reset
{
    [self.counter reset];
    [self.accum reset];
    [self.inputBuffer removeAllObjects];
}

- (id)calculateOutputValue
{
    
    if (self.bufferSize > 0) {
        id oldestValue = [self addBufferValue:self.hotInlet.value];
        
        if (oldestValue == NULL) {
            [self.counter hot:self.hotInlet.value];
            [self.accum hot:self.hotInlet.value];
        }else{
            double toSubtract = -[oldestValue doubleValue];
            double hotValue = [self.hotInlet.value doubleValue];
            double newValue = toSubtract+hotValue;
            [self.counter cold:@(self.inputBuffer.count - 1)];
            [self.counter hot:self.hotInlet.value];
            [self.accum hot:@(newValue)];
        }
        
    }else{
        
        [self.counter hot:self.hotInlet.value];
        [self.accum hot:self.hotInlet.value];
    }
    
    return [self.divide mainOutlet].value;
}

@end
