//
//  BSDSequence.m
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/15/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDSequence.h"

@implementation BSDSequence

- (id)initWithInlets:(NSArray *)inlets
{
    return [super initWithArguments:inlets];
}

- (void)setupWithArguments:(id)arguments
{
    self.name = @"sequence";
    NSArray *inlets = (NSArray *)arguments;
    
    if (inlets) {
        NSUInteger idx = 0;
        for (BSDInlet *anInlet in inlets) {
            BSDOutlet *anOutlet = [[BSDOutlet alloc]init];
            anOutlet.name = [NSString stringWithFormat:@"%lu",(unsigned long)idx];
            [self addPort:anOutlet];
            [anOutlet connectInlet:anInlet];
            idx ++;
        }
    }
}

- (void)calculateOutput
{
    for (BSDOutlet *anOutlet in self.outlets) {
        anOutlet.value = self.hotInlet.value;
    }
}


@end
