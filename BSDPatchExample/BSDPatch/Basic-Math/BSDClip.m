//
//  BSDClip.m
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/18/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDClip.h"
#import "BSDCreate.h"

@interface BSDClip ()

@property (nonatomic,strong)BSDMin *upperBound;
@property (nonatomic,strong)BSDMax *lowerBound;


@end

@implementation BSDClip

- (void)setupWithArguments:(id)arguments
{
    self.name = @"clip";
    self.upperBound = [BSDCreate minCold:@(0)];
    self.lowerBound = [BSDCreate maxCold:@(0)];

    
    self.minInlet = self.coldInlet;
    self.minInlet.name = @"min";
    self.maxInlet = [[BSDInlet alloc]initCold];
    self.maxInlet.name = @"max";
    [self addPort:self.maxInlet];
    
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
    
    
    [self.hotInlet forwardToPort:self.lowerBound.hotInlet];
    [self.lowerBound connect:self.upperBound.hotInlet];
    [self.upperBound.mainOutlet forwardToPort:self.mainOutlet];
    
}

- (void)calculateOutput
{
}

@end
