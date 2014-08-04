//
//  BSDLabel.m
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/20/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDLabel.h"

@implementation BSDLabel

- (instancetype)initWithUILabel:(UILabel *)label
{
    return [super initWithArguments:label];
}

- (void)setupWithArguments:(id)arguments
{
    self.name = @"label";
    UILabel *label = (UILabel *)arguments;
    if (label) {
        self.coldInlet.value = label;
    }
}

- (void)inletReceievedBang:(BSDInlet *)inlet
{
    if (inlet == self.hotInlet) {
        [self calculateOutput];
    }
}

- (void)calculateOutput
{
    NSDictionary *hot = self.hotInlet.value;
    UIView *cold = self.coldInlet.value;
    
    if (hot && cold) {
        for (NSString *aKey in hot.allKeys) {
            [cold setValue:hot[aKey] forKey:aKey];
        }
        
        self.mainOutlet.value = self.coldInlet.value;
    }
}

- (UILabel *)label
{
    return self.coldInlet.value;
}

@end
