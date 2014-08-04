//
//  BSDExample.m
//  BSDPatchExample
//
//  Created by Travis Henspeter on 8/4/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDExample.h"
#import "BSDCreate.h"

@interface BSDExample ()

@property (nonatomic,strong)UIView *superview;
@property (nonatomic,strong)NSMutableDictionary *graph;

@end

@implementation BSDExample

- (instancetype)initInView:(UIView *)view
{
    return [super initWithArguments:view];
}

- (void)setupWithArguments:(id)arguments
{
    self.name = @"example";
    self.debug = YES;
    UIView *superview = arguments;
    if (superview) {
        self.superview = superview;
        BSDView *view = [[BSDView alloc]initWithUIView:self.superview];
        self.graph[view.objectId] = view;
        [view view].backgroundColor = [UIColor yellowColor];
        UIView *newView = [[UIView alloc]initWithFrame:CGRectMake(30, 30, 200, 200)];
        BSDView *floater = [[BSDView alloc]initWithUIView:newView];
        self.graph[view.objectId] = floater;
        [view.view addSubview:newView];
        newView.backgroundColor = [UIColor brownColor];
    }
}

@end
