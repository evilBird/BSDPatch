//
//  BSDArrayDrip.m
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/20/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDArraySerialize.h"

@implementation BSDArraySerialize

- (instancetype)initWithArray:(NSArray *)array
{
    return [super initWithArguments:array];
}

- (void)setupWithArguments:(id)arguments
{
    self.name = @"array drip";
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
    if (inlet==self.hotInlet){
        NSArray *toDrip = self.coldInlet.value;
        if (toDrip) {
            for (id element in toDrip) {
                self.mainOutlet.value = element;
            }
        }
        
        self.doneOutlet.value = [BSDBang bang];
    }
}

@end
