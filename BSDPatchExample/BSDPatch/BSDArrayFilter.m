//
//  BSDArrayFilter.m
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/15/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDArrayFilter.h"

@implementation BSDArrayFilter

- (void)setupWithArguments:(id)arguments
{
    self.name = @"filter";
    
    if (arguments) {
        [self cold:arguments];
    }else{
        [self cold:[NSPredicate predicateWithValue:YES]];
    }
}

- (id)calculateOutputValue
{
    NSMutableArray *inputCopy = [self.hotInlet.value mutableCopy];
    NSPredicate *predicate = self.coldInlet.value;
    [inputCopy filterUsingPredicate:predicate];
    return inputCopy;
}

@end
