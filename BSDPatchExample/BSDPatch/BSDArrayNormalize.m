//
//  BSDArrayNormalize.m
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/15/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDArrayNormalize.h"
#import "BSDCreate.h"

@interface BSDArrayNormalize ()

@property (nonatomic,strong)BSDDivide *divide;

@end

@implementation BSDArrayNormalize

- (void)setupWithArguments:(id)arguments
{
    self.name = @"normalize";
    [self cold:@(1.0)];
    self.divide = [BSDCreate divide];
    [self.divide cold:@(1)];
    
}

- (id)normalizedArray:(NSArray *)array
{
    if (array) {
        NSNumber *sum = [array valueForKeyPath:@"@sum.self"];
        [self.divide cold:sum];
        NSMutableArray *outputContainer = [NSMutableArray array];
        for (NSNumber *num in array) {
            [self.divide hot:num];
            [outputContainer addObject:self.divide.mainOutlet.value];
        }
        
        return outputContainer;
    }
    
    return NULL;
}

- (id)calculateOutputValue
{
    return [self normalizedArray:self.hotInlet.value];
}

@end
