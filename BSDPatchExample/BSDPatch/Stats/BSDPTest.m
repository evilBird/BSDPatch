//
//  BSDPTest.m
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/15/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDPTest.h"
#import "BSDCreate.h"

@interface BSDPTest ()

@property (nonatomic,strong)BSDSequence *sequence;
@property (nonatomic,strong)BSDSubtract *subtractInputFromAvg;
@property (nonatomic,strong)BSDAverage *average;
@property (nonatomic,strong)BSDStdDev *stdDev;
@property (nonatomic,strong)BSDDivide *divideDiffByStdDev;
@property (nonatomic,strong)BSDEqualGreater *compareToSigLevel;
@property (nonatomic,strong)BSDAbs *absoluteValue;
@property (nonatomic,strong)BSDChange *change;

@end

@implementation BSDPTest

- (instancetype)initWithAlpha:(double)alpha bufferSize:(NSUInteger)bufferSize
{
    NSArray *args = @[@(alpha),@(bufferSize)];
    return [super initWithArguments:args];
}

- (void)setupWithArguments:(id)arguments
{
    self.name = @"p-test";
    NSArray *args = (NSArray *)arguments;
    
    if (!args) {
        _alpha = 0.95;
        _bufferSize = 0;
    }else {
        
        if (args.count > 0) {
            _alpha = [args[0] doubleValue];
        }
        
        if (args.count > 1) {
            _bufferSize = [args[1] integerValue];
            self.average = [BSDCreate averageBufferSize:args[1]];
            self.stdDev = [BSDCreate standardDeviationBufferSize:args[1]];
        }else{
            _bufferSize = 0;
            self.average = [BSDCreate average];
            self.stdDev = [BSDCreate standardDeviation];
        }
    }
    
    BSDOutlet *avgOutlet = [[BSDOutlet alloc]init];
    avgOutlet.name = self.average.name;
    [self addPort:avgOutlet];
    
    BSDOutlet *stdDevOutlet = [[BSDOutlet alloc]init];
    stdDevOutlet.name = self.stdDev.name;
    [self addPort:stdDevOutlet];
    
    self.compareToSigLevel = [BSDCreate equalOrGreater];
    self.absoluteValue = [BSDCreate absoluteValue];
    self.subtractInputFromAvg = [BSDCreate subtract];
    self.divideDiffByStdDev = [BSDCreate divide];
    self.change = [BSDCreate change];
    self.sequence = [BSDCreate sequenceInlets:@[self.stdDev.hotInlet, self.average.hotInlet, self.subtractInputFromAvg.hotInlet]];
    [self.hotInlet forwardToPort:self.sequence.hotInlet];
    
    self.compareToSigLevel.coldInlet.value = [self criticalValueForSignificance:self.alpha];
    
    [self.stdDev connect:self.divideDiffByStdDev.coldInlet];
    [self.average connect:self.subtractInputFromAvg.coldInlet];
    [self.subtractInputFromAvg connect:self.divideDiffByStdDev.hotInlet];
    
    [self.divideDiffByStdDev connect:self.absoluteValue.hotInlet];
    [self.absoluteValue connect:self.compareToSigLevel.hotInlet];
    [self.compareToSigLevel connect:self.change.hotInlet];
    
    [self.average.mainOutlet forwardToPort:avgOutlet];
    [self.stdDev.mainOutlet forwardToPort:stdDevOutlet];
    [self.change.mainOutlet forwardToPort:self.mainOutlet];
    
}

- (void)reset
{
    [self.average reset];
    [self.stdDev reset];
}

- (void)calculateOutput
{

}

- (NSNumber *)criticalValueForSignificance:(double)significance
{
    if (significance >= 0.99) {
        return @(2.58);
    }else if (significance >= 0.95){
        return @(1.96);
    }else if (significance >= 0.9){
        return @(1.645);
    }else{
        return @(1.96);
    }
}

@end
