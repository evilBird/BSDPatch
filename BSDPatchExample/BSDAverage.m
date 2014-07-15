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

@property (nonatomic,strong)BSDAccum *accum;
@property (nonatomic,strong)BSDCounter *counter;
@property (nonatomic,strong)BSDDivide *divide;

@end

@implementation BSDAverage

- (void)setupWithArguments:(id)arguments
{
    self.name = @"average";
    self.accum = [BSDCreate accumulate];
    self.counter = [BSDCreate counter];
    self.divide = [BSDCreate divide];
    
    [self.accum connectToHot:self.divide];
    [self.counter connectToCold:self.divide];
}

- (void)reset
{
    [self.counter reset];
    [self.accum reset];
}

- (id)calculateOutputValue
{
    [self.counter hot:[self hot]];
    [self.accum hot:[self hot]];
    
    return [self.divide mainOutlet].value;
}

@end
