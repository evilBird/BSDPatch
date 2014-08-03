//
//  BSDClipFilter.m
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/18/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDClipFilter.h"
#import "BSDCreate.h"

@interface BSDClipFilter ()

@property (nonatomic,strong)BSDEqualGreater *lowerBound;
@property (nonatomic,strong)BSDEqualLess *upperBound;
@property (nonatomic,strong)BSDAdd *add;
@property (nonatomic,strong)BSDEqual *equals;
@property (nonatomic,strong)BSDSequence *sequence;
@property (nonatomic,strong)BSDSpigot *spigot;

@end

@implementation BSDClipFilter

- (void)setupWithArguments:(id)arguments
{
    self.name = @"clip filter";
    self.upperBound = [BSDCreate equalOrLessCold:@(0)];
    self.lowerBound = [BSDCreate equalOrGreaterCold:@(0)];
    self.add = [BSDCreate add];
    self.spigot = [BSDCreate spigot];
    self.equals = [BSDCreate equalsCold:@(2)];
    self.equals.name = @"input is valid";
    self.add.name = @"add bools";
    self.upperBound.name = @"upper bound";
    self.lowerBound.name = @"lower bound";
    
    self.minInlet = self.coldInlet;
    self.minInlet.name = @"min";
    self.maxInlet = [[BSDInlet alloc]initCold];
    self.maxInlet.name = @"max";
    [self addPort:self.maxInlet];
    self.outOfRangeOutlet = [[BSDOutlet alloc]init];
    self.outOfRangeOutlet.name = @"out of range";
    [self addPort:self.outOfRangeOutlet];
    
    [self.minInlet forwardToPort:self.lowerBound.coldInlet];
    [self.maxInlet forwardToPort:self.upperBound.coldInlet];
    
    NSArray *args = (NSArray *)arguments;
    if ([args isKindOfClass:[NSArray class]]) {
        
        if (args.count > 0) {
            [self.minInlet input:args[0]];
        }
        if (args.count > 1) {
            [self.maxInlet input:args[1]];
        }
    }
    
    self.sequence = [BSDCreate sequenceInlets:@[self.upperBound.hotInlet,self.lowerBound.hotInlet,self.spigot.hotInlet]];
    [self.hotInlet forwardToPort:self.sequence.hotInlet];
    [self.upperBound connect:self.add.coldInlet];
    [self.lowerBound connect:self.add.hotInlet];
    [self.add connect:self.equals.hotInlet];
    [self.equals connect:self.spigot.coldInlet];
    
    __weak BSDClipFilter *WEAK_SELF = self;
    self.equals.outputBlock = ^(BSDObject *object, BSDOutlet *outlet){
        BOOL inRange = [outlet.value boolValue];
        
        if (!inRange) {
            WEAK_SELF.outOfRangeOutlet.value = [BSDBang bang];
        }
    };
    
    [self.spigot.mainOutlet forwardToPort:self.mainOutlet];
    
}


@end
