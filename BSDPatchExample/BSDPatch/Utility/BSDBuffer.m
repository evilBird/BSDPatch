//
//  BSDBuffer.m
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/18/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDBuffer.h"
#import "BSDCreate.h"

@interface BSDBuffer ()

@property (nonatomic)NSUInteger size;

@end

@implementation BSDBuffer

- (instancetype)initWithBufferSize:(NSNumber *)bufferSize
{
    return [super initWithArguments:bufferSize];
}

- (void)setupWithArguments:(id)arguments
{
    self.name = @"buffer";
    
    NSNumber *bufferSize = (NSNumber *)arguments;
    if (bufferSize) {
        self.size = bufferSize.integerValue;
    }else{
        self.size = 64;
    }
    
    self.coldInlet.value = [NSMutableArray array];
    self.auxOutlet = [[BSDOutlet alloc]init];
    self.auxOutlet.name = @"auxOutlet";
    [self addPort:self.auxOutlet];

}

- (void)reset
{
    [self.coldInlet.value removeAllObjects];
}

- (void)inletReceievedBang:(BSDInlet *)inlet
{
    if (inlet == self.hotInlet) {
        [self reset];
        [self calculateOutput];
    }
}

- (void)calculateOutput
{
    id hot = self.hotInlet.value;
    if (hot != NULL) {
        NSMutableArray *buffer = self.coldInlet.value;
        if (buffer.count >= self.size) {
            NSInteger toRemove = self.size - 2;
            [buffer removeObjectAtIndex:toRemove];
            [buffer insertObject:hot atIndex:0];
            self.auxOutlet.value = buffer[toRemove];
        }else{
            [buffer insertObject:hot atIndex:0];
        }
        
        self.mainOutlet.value = buffer.mutableCopy;
    }
}

@end
