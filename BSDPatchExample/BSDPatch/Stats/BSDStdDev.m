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

@property (nonatomic,strong)BSDAverage *average;
@property (nonatomic,strong)BSDAccum *accum;
@property (nonatomic,strong)BSDSubtract *deviance;
@property (nonatomic,strong)BSDPower *squaredDeviance;
@property (nonatomic,strong)BSDPower *rootDeviance;
@property (nonatomic,strong)BSDSubtract *dof;
@property (nonatomic,strong)BSDDivide *divide;
@property (nonatomic,strong)NSMutableArray *inputBuffer;
@property (nonatomic)NSUInteger bufferSize;

@end

@implementation BSDStdDev

- (id)initWithBufferSize:(NSUInteger)bufferSize
{
    return [super initWithArguments:@(bufferSize)];
}

/*
 Standard Deviation block diagram
 [self hot]->[average hot]
 [avg out]-> [deviance cold]
 [self hot]-> [counter hot]
 [counter out]-> [dof hot]
 [dof out]-> [divide cold]
 [self hot]-> [deviance hot]
 [deviance out]->[squaredDev hot]
 [squaredDev out]->[accum hot]
 [accum out]-> [divide hot]
 [divide out]->[rootDev hot]
 [rootDev out]-> [self out];
 */

- (void)setupWithArguments:(id)arguments
{
    
    NSNumber *bufferSize = (NSNumber *)arguments;
    
    if (bufferSize) {
        self.bufferSize = bufferSize.integerValue;
        self.inputBuffer = [NSMutableArray array];
        self.average = [[BSDAverage alloc]initWithBufferSize:self.bufferSize];
    }else{
        self.average = [BSDCreate average];
    }
    self.name = @"standard deviation";

    self.counter = [BSDCreate counter];
    self.divide = [BSDCreate divide];
    self.deviance = [BSDCreate subtract];
    self.dof = [BSDCreate subtract];
    self.squaredDeviance = [BSDCreate power];
    self.rootDeviance = [BSDCreate power];
    self.accum = [BSDCreate accumulate];
    
    self.dof.coldInlet.value = @(1);
    self.squaredDeviance.coldInlet.value = @(2);
    self.rootDeviance.coldInlet.value = @(0.5);
    [self.average connect:self.deviance.coldInlet];
    [self.counter connect:self.dof.hotInlet];
    [self.dof connect:self.divide.coldInlet];
    [self.deviance connect:self.squaredDeviance.hotInlet];
    [self.squaredDeviance connect:self.accum.hotInlet];
    [self.accum connect:self.divide.hotInlet];
    [self.divide connect:self.rootDeviance.hotInlet];
    
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
        
        if (oldestValue == NULL) {
            
            [self.average.hotInlet input:self.hotInlet.value];
            [self.counter.hotInlet input:self.hotInlet.value];
            [self.deviance.hotInlet input:self.hotInlet.value];
            
        }else{
            
            double toSubtract = -[oldestValue doubleValue];
            double coldValue = [self.accum.coldInlet.value doubleValue];
            double newValue = toSubtract+coldValue;
            [self.accum.coldInlet input:@(newValue)];
            [self.average.hotInlet input:self.hotInlet.value];
            [self.counter.hotInlet input:@(self.inputBuffer.count - 1)];
            [self.counter.hotInlet input:self.hotInlet.value];
            [self.deviance.hotInlet input:self.hotInlet.value];
        }
        
    }else{
        
        [self.average.hotInlet input:self.hotInlet.value];
        [self.counter.hotInlet input:self.hotInlet.value];
        [self.deviance.hotInlet input:self.hotInlet.value];
    }
    
    self.mainOutlet.value = [self.rootDeviance mainOutlet].value;
}



@end
