//
//  BSDArrayElement.m
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/18/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDArrayElement.h"
#import "BSDCreate.h"

@interface BSDArrayElement ()

@property (nonatomic,strong)BSDClip *clipIndex;

@end

@implementation BSDArrayElement

- (void)setupWithArguments:(id)arguments
{
    self.name = @"array element";
    self.clipIndex = nil;
    NSArray *args = (NSArray *)arguments;
    if (args && [args isKindOfClass:[NSArray class]]) {
        [self.coldInlet input:args];
        self.clipIndex = [BSDCreate clipMin:@(0) Max:@(args.count - 1)];
    }else{
        self.clipIndex = [BSDCreate clipMin:@(0) Max:@(0)];
    }
    
    [self.hotInlet forwardToPort:self.clipIndex.hotInlet];
}

- (void)calculateOutput
{
    if (self.coldInlet.value != NULL) {
        [self.clipIndex.minInlet input:@(0)];
        [self.clipIndex.maxInlet input:@([self.coldInlet.value count] - 1)];
        self.mainOutlet.value = self.coldInlet.value[[self.clipIndex.mainOutlet.value integerValue]];
    }
}

@end
