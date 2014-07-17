//
//  BSDAdd.m
//  BSDLang
//
//  Created by Travis Henspeter on 7/12/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDAdd.h"

@implementation BSDAdd

- (void)setupWithArguments:(id)arguments
{
    self.name = @"add";
}

- (void)calculateOutput
{
    self.mainOutlet.value = @([self.hotInlet.value doubleValue] + [self.coldInlet.value doubleValue]);
}


@end
