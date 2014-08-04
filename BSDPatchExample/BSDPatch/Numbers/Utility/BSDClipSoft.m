//
//  BSDClip.m
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/18/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDClipSoft.h"
#import "BSDCreate.h"

@implementation BSDClipSoft

- (instancetype)initWithMinValue:(NSNumber *)minValue
                        maxValue:(NSNumber *)maxValue
{
    return [super initWithArguments:@{@"minValue":minValue,
                                      @"maxValue":maxValue}];
}

- (void)setupWithArguments:(id)arguments
{
    self.name = @"clip";
    self.coldInlet.open = NO;
    self.minInlet = [[BSDInlet alloc]init];
    self.minInlet.name = @"minValue";
    self.minInlet.value = @0;
    [self addPort:self.minInlet];
    
    self.maxInlet = [[BSDInlet alloc]init];
    self.maxInlet.name = @"maxValue";
    self.maxInlet.value = @0;
    [self addPort:self.maxInlet];
    
    NSDictionary *args = arguments;
    if (args) {
        self.minInlet.value = args[@"minValue"];
        self.maxInlet.value = args[@"maxValue"];
    }
}

- (void)calculateOutput
{
    NSNumber *min = self.minInlet.value;
    NSNumber *max = self.maxInlet.value;
    NSNumber *hot = self.hotInlet.value;
    
    if (hot.floatValue < min.floatValue) {
        self.mainOutlet.value = min;
    }else if (hot.floatValue > max.floatValue){
        self.mainOutlet.value = max;
    }else{
        self.mainOutlet.value = hot;
    }
    
}

@end
