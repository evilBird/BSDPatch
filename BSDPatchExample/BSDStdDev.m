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
@property (nonatomic,strong)BSDCounter *counter;
@property (nonatomic,strong)BSDSubtract *deviance;
@property (nonatomic,strong)BSDPower *squaredDeviance;
@property (nonatomic,strong)BSDPower *rootDeviance;
@property (nonatomic,strong)BSDSubtract *dof;
@property (nonatomic,strong)BSDDivide *divide;


@end

@implementation BSDStdDev

- (void)setupWithArguments:(id)arguments
{
    
    self.name = @"std dev";
    
    self.counter = [BSDCreate counter];
    self.divide = [BSDCreate divide];
    self.average = [BSDCreate average];
    self.deviance = [BSDCreate subtract];
    self.dof = [BSDCreate subtract];
    self.squaredDeviance = [BSDCreate power];
    self.rootDeviance = [BSDCreate power];
    self.accum = [BSDCreate accumulate];
    
    /*
     Standard Deviation
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
    
    [self.dof cold:@(1)];
    [self.squaredDeviance cold:@(2)];
    [self.rootDeviance cold:@(0.5)];
    [self.average connectToCold:self.deviance];
    [self.counter connectToHot:self.dof];
    [self.dof connectToCold:self.divide];
    [self.deviance connectToHot:self.squaredDeviance];
    [self.squaredDeviance connectToHot:self.accum];
    [self.accum connectToHot:self.divide];
    [self.divide connectToHot:self.rootDeviance];
    
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
    [self.deviance hot:[self hot]];
    
    return [self.rootDeviance mainOutlet].value;
}

@end
