//
//  BSDChange.m
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/15/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDChange.h"

@implementation BSDChange

- (void)setupWithArguments:(id)arguments
{
    self.name = @"change";
    [self cold:@(0)];
}

- (id)calculateOutputValue
{
    if ([self hotInletValue] != [self coldInletValue]) {
        [self cold:[self hotInletValue]];
        return [self hotInletValue];
    }
    
    return NULL;
}

@end
