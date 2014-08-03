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

- (void)setupWithArguments:(id)arguments
{
    self.name = @"buffer";
    
    NSNumber *bufferSize = (NSNumber *)arguments;
    if (bufferSize) {
        self.size = bufferSize.integerValue;
    }else{
        self.size = 64;
    }
    _bufferSize = self.size;
    
    self.coldInlet.value = [NSMutableArray array];

}

- (void)reset
{
    [self.coldInlet.value removeAllObjects];
}

- (void)calculateOutput
{
    id hot = self.hotInlet.value;
    if (hot != NULL) {
        NSMutableArray *buffer = self.coldInlet.value;
        if (buffer.count >= self.size) {
            NSInteger toRemove = self.size - 2;
            self.mainOutlet.value = buffer[toRemove];
            [buffer removeObjectAtIndex:toRemove];
            [buffer insertObject:hot atIndex:0];
        }else{
            [buffer insertObject:hot atIndex:0];
            self.mainOutlet.value = @(0);
        }
    }
}

@end
