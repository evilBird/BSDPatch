//
//  BSDAbs.m
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/15/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDAbs.h"

@implementation BSDAbs

- (void)setupWithArguments:(id)arguments
{
    self.name = @"absolute value";
    self.coldInlet.open = NO;
}

- (void)calculateOutput
{
    self.mainOutlet.value = @(fabs([self.hotInlet.value doubleValue]));
}


@end
