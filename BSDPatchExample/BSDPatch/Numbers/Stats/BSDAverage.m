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

@property (nonatomic,strong)BSDSequence *sequence;
@property (nonatomic,strong)BSDSubtract *subtract;
@property (nonatomic,strong)BSDAccum *accum;
@property (nonatomic,strong)BSDCounter *counter;
@property (nonatomic,strong)BSDDivide *divide;
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

    }
    
    self.name = @"average";
    self.accum = [BSDCreate accumulate];
    self.counter = [BSDCreate counter];
    self.divide = [BSDCreate divide];
    self.subtract = [BSDCreate subtractCold:@(0)];
    self.sequence = [BSDCreate sequenceInlets:@[self.counter.hotInlet,self.subtract.hotInlet]];
    [self.hotInlet forwardToPort:self.sequence.hotInlet];
    [self.subtract connect:self.accum.hotInlet];
    [self.accum connect:self.divide.hotInlet];
    [self.counter connect:self.divide.coldInlet];
    [self.divide.mainOutlet forwardToPort:self.mainOutlet];
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

- (void)calculateOutput
{
    if (self.bufferSize > 0) {
        id oldestValue = [self addBufferValue:self.hotInlet.value];
        
        if (oldestValue != NULL) {
            [self.subtract.coldInlet input:oldestValue];
            [self.counter.coldInlet input:@(self.inputBuffer.count - 1)];
            
        }else{
            [self.subtract.coldInlet input:@(0)];
        }
    }
}


@end
