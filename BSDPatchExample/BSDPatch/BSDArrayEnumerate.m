//
//  BSDArrayDripSlow.m
//  BSDPatchExample
//
//  Created by Travis Henspeter on 8/3/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDArrayEnumerate.h"

@implementation BSDArrayEnumerate

- (instancetype)initWithArray:(NSArray *)array
{
    return [super initWithArguments:array];
}

- (void)setupWithArguments:(id)arguments
{
    self.name = @"array enumerate";
    NSArray *array = arguments;
    if (arguments) {
        self.coldInlet.value = array;
    }
    
    self.doneOutlet = [[BSDOutlet alloc]init];
    self.doneOutlet.name = @"doneOutlet";
    [self addPort:self.doneOutlet];
    
}

- (void)inletReceievedBang:(BSDInlet *)inlet
{
    if (inlet == self.hotInlet) {
        
        NSMutableArray *arrayCopy = self.coldInlet.value;
        if (arrayCopy.count > 0) {
            id value = arrayCopy.firstObject;
            [arrayCopy removeObjectAtIndex:0];
            self.coldInlet.value = arrayCopy;
            self.mainOutlet.value = value;
        }
        NSArray *cold = self.coldInlet.value;
        if (cold.count == 0) {
            self.doneOutlet.value = [BSDBang bang];
        }
    }

}

@end
