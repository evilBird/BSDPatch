//
//  BSDPrependKey.m
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/19/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDPrependKey.h"

@implementation BSDPrependKey

- (void)setupWithArguments:(id)arguments
{
    self.name = @"prepend key";
    
    NSString *key = (NSString *)arguments;
    if (key) {
        self.coldInlet.value = key;
    }
}

- (void)calculateOutput
{
    id hot = self.hotInlet.value;
    NSString *key = self.coldInlet.value;
    if (key && hot != NULL) {
        self.mainOutlet.value = @{key: hot};
    }
}

@end
