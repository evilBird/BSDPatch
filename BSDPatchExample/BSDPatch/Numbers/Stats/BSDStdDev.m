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

@property (nonatomic,strong)BSDSequence *sequence;
@property (nonatomic,strong)BSDSequence *sub_sequence;
@property (nonatomic,strong)BSDSequence *sub_sub_sequence;
@property (nonatomic,strong)BSDMultiply *invertOld;
@property (nonatomic,strong)BSDBangBox *bangBox;
@property (nonatomic,strong)BSDAdd *addNew;
@property (nonatomic,strong)BSDSubtract *subtract;
@property (nonatomic,strong)BSDAverage *average;
@property (nonatomic,strong)BSDAccum *accum;
@property (nonatomic,strong)BSDSubtract *deviance;
@property (nonatomic,strong)BSDExponent *squaredDeviance;
@property (nonatomic,strong)BSDExponent *rootDeviance;
@property (nonatomic,strong)BSDExponent *rootDof;
@property (nonatomic,strong)BSDDivide *normDof;
@property (nonatomic,strong)BSDSubtract *dof;
@property (nonatomic,strong)BSDDivide *divide;
@property (nonatomic,strong)BSDCounter *counter;
@property (nonatomic,strong)BSDSubtract *subtractOldFromBuffer;
@property (nonatomic,strong)BSDMin *counterTopBound;
@property (nonatomic,strong)BSDBuffer *buffer;
@property (nonatomic,strong)BSDMin *clipCounter;
@property (nonatomic,strong)NSMutableArray *inputBuffer;

@end

@implementation BSDStdDev

- (id)initWithBufferSize:(NSUInteger)bufferSize
{
    return [super initWithArguments:@(bufferSize)];
}

- (void)setupWithArguments:(id)arguments
{
    self.name = @"standard deviation";
    
    self.muOut = [[BSDOutlet alloc]init];
    self.muOut.name = @"mu";
    [self addPort:self.muOut];
    
    self.nOut = [[BSDOutlet alloc]init];
    self.nOut.name = @"n";
    [self addPort:self.nOut];
    
    self.inputVal = [[BSDOutlet alloc]init];
    self.inputVal.name = @"input";
    [self addPort:self.inputVal];
    
    NSNumber *bufferSize = (NSNumber *)arguments;
    if (bufferSize) {
        _bufferSize = bufferSize.integerValue;
        [self configureWithBufferSize:_bufferSize];
        
    }else{
        _bufferSize = 0;
        self.average = [BSDCreate average];
    }
}

- (void)configureWithBufferSize:(NSUInteger)bufferSize
{
    _bufferSize = bufferSize;
    self.subtract = [BSDCreate subtractCold:@(0)];
    
    self.average = [BSDCreate averageBufferSize:@(bufferSize)];
    self.average.name = @"mu";
    self.counter = [BSDCreate counter];
    self.counter.name = @"n";
    self.deviance = [BSDCreate subtract];
    self.deviance.name = @"err = (x-mu)";
    self.clipCounter = [BSDCreate minCold:@(bufferSize)];
    self.clipCounter.name = @"n <= size";
    self.divide = [BSDCreate divide];
    self.divide.name = @"var = sse/dof";
    self.squaredDeviance = [BSDCreate powerCold:@(2)];
    self.squaredDeviance.name = @"sq err = err^2";
    self.dof = [BSDCreate subtractCold:@(1)];
    self.dof.name = @"dof = n - 1";
    self.rootDof = [BSDCreate powerCold:@(0.5)];
    self.rootDof.name = @"root dof";
    self.normDof = [BSDCreate divide];
    self.normDof.name = @"norm dof";
    
    self.sequence = [BSDCreate sequenceInlets:@[self.average.hotInlet, self.counter.hotInlet,self.deviance.hotInlet]];
    [self.average connect:self.deviance.coldInlet];
    [self.counter connect:self.clipCounter.hotInlet];
    [self.clipCounter connect:self.dof.hotInlet];
    [self.dof connect:self.divide.coldInlet];
    [self.deviance connect:self.squaredDeviance.hotInlet];
    
    self.buffer = [BSDCreate bufferSize:@(bufferSize)];
    self.buffer.name = @"std dev input buffer";
    self.accum = [BSDCreate accumulate];
    self.accum.name = @"raw sse = sse + err";
    self.invertOld = [BSDCreate multiplyCold:@(-1)];
    self.invertOld.name = @"invert old";
    self.rootDeviance = [BSDCreate powerCold:@(0.5)];
    self.rootDeviance.name = @"sqrt(sse)";
    
    self.sub_sequence = [BSDCreate sequenceInlets:@[self.buffer.hotInlet,self.accum.hotInlet]];
    [self.squaredDeviance connect:self.sub_sequence.hotInlet];
    
    [self.buffer connect:self.invertOld.hotInlet];
    [self.invertOld connect:self.accum.hotInlet];
    [self.accum connect:self.rootDeviance.hotInlet];
    [self.rootDeviance connect:self.divide.hotInlet];
    
    [self.divide.mainOutlet forwardToPort:self.mainOutlet];
    [self.average.mainOutlet forwardToPort:self.muOut];
    [self.clipCounter.mainOutlet forwardToPort:self.nOut];
    [self.hotInlet forwardToPort:self.inputVal];
    [self.hotInlet forwardToPort:self.sequence.hotInlet];
}

- (void)reset
{
    [self.average reset];
    [self.counter reset];
    [self.accum reset];
    [self.buffer reset];
}



@end
