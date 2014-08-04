//
//  BSDArrayFilter.m
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/15/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDArrayFilter.h"

@implementation BSDArrayFilter

- (instancetype)initWithPredicates:(NSPredicate *)predicate
{
    return [super initWithArguments:predicate];
}

- (void)setupWithArguments:(id)arguments
{
    self.name = @"filter";
    NSPredicate *predicate = arguments;
    
    if (predicate) {
        self.coldInlet.value = arguments;
    }else{
        self.coldInlet.value = [NSPredicate predicateWithValue:YES];
    }

}

- (void)calculateOutput
{
    NSMutableArray *inputCopy = [self.hotInlet.value mutableCopy];
    NSArray *hot = self.hotInlet.value;
    NSPredicate *cold = self.coldInlet.value;
    if (hot && cold) {
        self.mainOutlet.value = [hot filteredArrayUsingPredicate:cold];
    }

}


@end
