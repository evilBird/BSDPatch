//
//  BSDPrependKey.m
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/19/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDAddKey.h"

@implementation BSDAddKey

- (instancetype)initWithKey:(NSString *)key
{
    return [super initWithArguments:key];
}

- (void)setupWithArguments:(id)arguments
{
    self.name = @"add key";
    
    NSString *key = (NSString *)arguments;
    if (key && key.length > 0) {
        self.coldInlet.value = key;
    }else{
        self.coldInlet.value = @"ERROR";
    }
}

- (void)calculateOutput
{
    id hot = self.hotInlet.value;
    NSString *key = self.coldInlet.value;
    self.mainOutlet.value = @{key: hot};
}

@end
