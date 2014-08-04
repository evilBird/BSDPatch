//
//  BSDTouchGenerator.m
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/20/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDTouchGenerator.h"
#import "BSDCreate.h"

@interface BSDTouchGenerator ()<UIGestureRecognizerDelegate>

@end

@implementation BSDTouchGenerator

- (instancetype)initWithView:(UIView *)view
{
    return [super initWithArguments:view];
}

- (void)setupWithArguments:(id)arguments
{
    self.name = @"touch generator";
    UIView *view = (UIView *)arguments;
    if (view) {
        UIPanGestureRecognizer *gesture = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(receivedNewData:)];
        self.coldInlet.value = gesture;
        [view addGestureRecognizer:gesture];
        _view = view;
    }
}

- (void)receivedNewData:(id)data
{
    UIPanGestureRecognizer *gesture = (UIPanGestureRecognizer *)data;
    UIView *view = self.view;
    if (gesture && view) {
        self.mainOutlet.value = @{@"location": [NSValue wrapPoint:[gesture locationInView:view]],
                                  @"velocity": [NSValue wrapPoint:[gesture velocityInView:view]]};
    }
}

- (void)inletReceievedBang:(BSDInlet *)inlet
{
    if (inlet == self.hotInlet) {
        self.mainOutlet.value = self.mainOutlet.value;
    }
}


- (void)setView:(UIView *)view
{
    if (!self.view) {
        [self setupWithArguments:view];
    }else{
        [self.view removeGestureRecognizer:self.coldInlet.value];
        [self setupWithArguments:view];
    }
}

- (void)test
{
    self.outputBlock = ^(BSDObject *object, BSDOutlet *outlet){
        NSLog(@"touch generator emitted value %@",outlet.value);
    };
}

@end
