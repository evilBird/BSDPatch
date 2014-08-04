//
//  BSDMedian.m
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/15/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDMedian.h"
#import "BSDCreate.h"

@interface BSDMedian ()

@property (nonatomic) NSUInteger bufferSize;
@property (nonatomic) NSUInteger count;

@end

@implementation BSDMedian

- (id)initWithBufferSize:(NSNumber *)bufferSize
{
    return [super initWithArguments:bufferSize];
}

- (void)setupWithArguments:(id)arguments
{
    self.name = @"median";
    NSNumber *bufferSize = (NSNumber *)arguments;
    
    if (bufferSize) {
        _bufferSize = bufferSize.integerValue;
        BSDBuffer *buffer = [[BSDBuffer alloc]initWithBufferSize:bufferSize];
        self.coldInlet.value = buffer;
        
    }else{
        _bufferSize = 0;
        NSMutableArray *unlimitedBuffer = [[NSMutableArray alloc]init];
        self.coldInlet.value = unlimitedBuffer;
    }

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
    id cold = self.coldInlet.value;
    if ([cold isKindOfClass:[BSDBuffer class]]) {
        BSDBuffer *buffer = self.coldInlet.value;
        [buffer.hotInlet input:[BSDBang bang]];
    }else if ([cold isKindOfClass:[NSMutableArray class]]){
        NSMutableArray *unlimitedBuffer = self.coldInlet.value;
        [unlimitedBuffer removeAllObjects];
        self.count = 1;
    }
}

- (void)calculateOutput
{
    NSNumber *hot = self.hotInlet.value;
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"doubleValue" ascending:YES];
    NSArray *sortedBuffer = nil;
    if (self.bufferSize > 0) {
        BSDBuffer *buffer = self.coldInlet.value;
        [buffer.hotInlet input:hot];
        NSMutableArray *bufferCopy = buffer.mainOutlet.value;
        sortedBuffer = [bufferCopy sortedArrayUsingDescriptors:@[sortDescriptor]];
        
    }else {
        NSMutableArray *unlimitedBuffer = self.coldInlet.value;
        [unlimitedBuffer addObject:hot];
        sortedBuffer = [unlimitedBuffer sortedArrayUsingDescriptors:@[sortDescriptor]];
    }
    NSUInteger index = sortedBuffer.count/2;
    self.mainOutlet.value = sortedBuffer[index];

}


@end
