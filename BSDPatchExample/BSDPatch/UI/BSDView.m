//
//  BSDView.m
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/19/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDView.h"

@implementation BSDView

- (instancetype)initWithUIView:(UIView *)view
{
    return [super initWithArguments:view];
}

- (void)setupWithArguments:(id)arguments
{
    self.name = @"view";
    UIView *view = (UIView *)arguments;
    if (view) {
        self.coldInlet.value = view;
    }
}

- (void)calculateOutput
{
    NSDictionary *hot = self.hotInlet.value;
    UIView *cold = self.coldInlet.value;
    
    if (hot && cold) {
        NSString *keyPath = hot.allKeys.firstObject;
        NSValue *value = hot[keyPath];
        [cold setValue:value forKeyPath:keyPath];
        self.mainOutlet.value = self.coldInlet.value;
    }
}

- (UIView *)view
{
    return self.coldInlet.value;
}




@end
