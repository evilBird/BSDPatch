//
//  BSDMedian.m
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/15/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDMedian.h"

@interface BSDMedian ()

//@property (nonatomic)NSUInteger bufferSize;
@property (nonatomic,strong)NSMutableArray *inputBuffer;

@end

@implementation BSDMedian

- (id)initWithBufferSize:(NSUInteger)bufferSize
{
    return [super initWithArguments:@(bufferSize)];
}

- (void)setupWithArguments:(id)arguments
{
    NSNumber *bufferSize = (NSNumber *)arguments;
    
    if (bufferSize) {
        _bufferSize = bufferSize.integerValue;
    }else{
        _bufferSize = 0;
    }
    self.name = @"median";
    self.inputBuffer = [NSMutableArray array];

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
    if (self.inputBuffer.count) {
        [self.inputBuffer removeAllObjects];
    }
}

- (void)calculateOutput
{
    if (self.bufferSize > 0) {
        [self addBufferValue:self.hotInlet.value];
    }else if (self.hotInlet.value != NULL){
        [self.inputBuffer addObject:self.hotInlet.value];
    }
    
    if (self.inputBuffer.count) {
        NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"doubleValue" ascending:YES];
        NSMutableArray *bufferCopy = [self.inputBuffer mutableCopy];
        [bufferCopy sortUsingDescriptors:@[sortDescriptor]];
        NSUInteger index = bufferCopy.count/2;
        if (index < bufferCopy.count) {
            self.mainOutlet.value = bufferCopy[index];
        }
    }
}


@end
