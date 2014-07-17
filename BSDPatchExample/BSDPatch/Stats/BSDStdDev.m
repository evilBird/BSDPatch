//
//  BSDVariance.m
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/14/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDStdDev.h"
#import "BSDCreate.h"

@interface BSDStdDev ()

@property (nonatomic,strong)BSDSequence *sequence;
@property (nonatomic,strong)BSDSubtract *subtract;
@property (nonatomic,strong)BSDAverage *average;
@property (nonatomic,strong)BSDAccum *accum;
@property (nonatomic,strong)BSDSubtract *deviance;
@property (nonatomic,strong)BSDPower *squaredDeviance;
@property (nonatomic,strong)BSDPower *rootDeviance;
@property (nonatomic,strong)BSDSubtract *dof;
@property (nonatomic,strong)BSDDivide *divide;
@property (nonatomic,strong)BSDCounter *counter;
@property (nonatomic,strong)NSMutableArray *inputBuffer;

@end

@implementation BSDStdDev

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
        self.average = [BSDCreate averageBufferSize:bufferSize];
    }else{
        self.average = [BSDCreate average];
    }
    self.name = @"standard deviation";

    self.counter = [BSDCreate counter];
    self.divide = [BSDCreate divide];
    self.deviance = [BSDCreate subtract];
    self.subtract = [BSDCreate subtractCold:@(0)];
    self.dof = [BSDCreate subtractCold:@(1)];
    self.squaredDeviance = [BSDCreate powerCold:@(2)];
    self.rootDeviance = [BSDCreate powerCold:@(0.5)];
    self.accum = [BSDCreate accumulate];
    
    self.sequence = [BSDCreate sequenceInlets:@[self.average.hotInlet, self.counter.hotInlet, self.subtract.hotInlet]];
    [self.hotInlet forwardToPort:self.sequence.hotInlet];
    [self.subtract connect:self.accum.hotInlet];
    [self.average connect:self.deviance.coldInlet];
    [self.counter connect:self.dof.hotInlet];
    [self.dof connect:self.divide.coldInlet];
    [self.deviance connect:self.squaredDeviance.hotInlet];
    [self.squaredDeviance connect:self.accum.hotInlet];
    [self.accum connect:self.divide.hotInlet];
    [self.divide connect:self.rootDeviance.hotInlet];
    
    [self.rootDeviance.mainOutlet forwardToPort:self.mainOutlet];
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
    [self.average reset];
    [self.counter reset];
    [self.accum reset];
    [self.inputBuffer removeAllObjects];
}

- (void)calculateOutput
{
    if (self.bufferSize > 0) {
        
        id oldestValue = [self addBufferValue:self.accum.hotInlet.value];
        
        if (oldestValue != NULL) {
            [self.subtract.coldInlet input:oldestValue];
            [self.counter.coldInlet input:@(self.inputBuffer.count - 1)];
            
        }else{
            [self.subtract.coldInlet input:@(0)];

        }
        
    }
    
}



@end
