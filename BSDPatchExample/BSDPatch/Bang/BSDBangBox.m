//
//  BSDBangBox.m
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/18/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDBangBox.h"

@implementation BSDBangBox

- (void)setupWithArguments:(id)arguments
{
    self.name = @"bang box";
}

- (void)calculateOutput
{
    self.mainOutlet.value = [BSDBang bang];
}

@end
