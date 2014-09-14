//
//  BSDViewController.m
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/14/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDViewController.h"
#import "BSDExamplePatch.h"
#import "BSDExample.h"

@interface BSDViewController ()

@property (nonatomic,strong)BSDExamplePatch *examplePatch;
@property (nonatomic,strong)BSDExample *example;

@end

@implementation BSDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self test];
}

- (void)test
{
    self.example = [[BSDExample alloc]initInView:self.view];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
