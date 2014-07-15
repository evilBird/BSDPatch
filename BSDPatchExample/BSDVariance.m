//
//  BSDVariance.m
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/14/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDVariance.h"
#import "BSDCreate.h"

@interface BSDVariance ()

@property (nonatomic,strong)BSDAverage *average;
@property (nonatomic,strong)BSDAccum *accum;
@property (nonatomic,strong)BSDCounter *counter;
@property (nonatomic,strong)BSDSubtract *deviance;
@property (nonatomic,strong)BSDSubtract *dof;
@property (nonatomic,strong)BSDDivide *divide;


@end

@implementation BSDVariance

- (void)setupWithArguments:(id)arguments
{
    /*
     hot inlet goes to avg, counter, deviance
     
     avg goes to 
     
     */
    
    self.accum = [BSDCreate accumulate];
    self.counter = [BSDCreate counter];
    self.divide = [BSDCreate divide];
    self.average = [BSDCreate average];
    self.deviance = [BSDCreate subtract];
    self.dof = [BSDCreate subtract];
    
    
    [self.counter connectToHot:self.dof];
    [self.dof cold:@(1)];

    [self.dof connectToCold:self.divide];
    [self.deviance connectToHot:self.divide];
    [self.average connectToCold:self.deviance];
    
}

- (void)reset
{
    [self.average reset];
    [self.counter reset];
    [self.accum reset];
}

- (id)calculateOutputValue
{
    [self.average hot:[self hot]];
    [self.counter hot:[self hot]];
    [self.accum hot:[self hot]];
    
    return [self.divide mainOutlet].value;
}

@end
