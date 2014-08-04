//
//  BSDCounter.m
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/14/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDCounter.h"

@interface BSDCounter ()

@property (nonatomic)NSNumber *stepSize;
@property (nonatomic)NSNumber *initialValue;

@end

@implementation BSDCounter

- (instancetype)initWithStepSize:(NSNumber *)stepSize
                    initialValue:(NSNumber *)initialValue
{
    return [super initWithArguments:@{@"stepSize":stepSize,
                                      @"initialValue":initialValue}];
}

- (void)setupWithArguments:(NSDictionary *)arguments
{
    self.name = @"counter";
    NSDictionary *args = arguments;
    if (args) {
        self.stepSize = args[@"stepSize"];
        self.initialValue = args[@"initialValue"];
        self.coldInlet.value = self.initialValue;
    }else{
        self.stepSize = @1;
        self.initialValue = @0;
        self.coldInlet.value = self.initialValue;
    }
}

- (void)inletReceievedBang:(BSDInlet *)inlet
{
    [self calculateOutput];
}

- (void)reset
{
    self.coldInlet.value = self.initialValue;
    
}

- (void)calculateOutput
{
    double cold = [self.coldInlet.value doubleValue];
    double step = self.stepSize.doubleValue;
    double result = cold+step;
    self.coldInlet.value = @(result);
    self.mainOutlet.value = @(result);
}

@end
