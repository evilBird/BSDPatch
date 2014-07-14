//
//  BSDViewController.m
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/14/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDViewController.h"
#import "BSDPatch.h"

@interface BSDViewController () <BSDObjectOutputUser>

@property(nonatomic,strong)BSDDistance *distance;
@property(nonatomic,strong)UILabel *distanceLabel;
@property(nonatomic,strong)UIPanGestureRecognizer *gestureRecognizer;

@end

@implementation BSDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    //Configure the BSDDistance object
    self.distance = [[BSDDistance alloc]initWithArguments:@[@"x0",@"xf",@"y0",@"yf"]];
    self.distance.name = @"distance";
    
    //Register as an output user
    self.distance.outputUser = self;
    
    //Set the reference point, from which distance will be measured
    [self.distance hot:@[@"x0",@(self.view.center.x)]];
    [self.distance hot:@[@"y0",@(self.view.center.y)]];
    
    //Set up distanceLabel, which will display the gesture recognizer's touch distance from the reference point
    
    self.distanceLabel = [[UILabel alloc]initWithFrame:self.view.bounds];
    self.distanceLabel.textAlignment = NSTextAlignmentCenter;
    self.distanceLabel.numberOfLines = 2;
    [self.view addSubview:self.distanceLabel];
    
    //Set up our gesture recognizer, which will feed input to the distance object
    self.gestureRecognizer = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(handlePanGesture:)];
    [self.view addGestureRecognizer:self.gestureRecognizer];


}

- (void)handlePanGesture:(UIPanGestureRecognizer *)sender
{
    CGPoint location = [sender locationInView:self.view];
    [self.distance hot:@[@"xf",@(location.x)]];
    [self.distance hot:@[@"yf",@(location.y)]];
}

- (void)BSDObject:(BSDObject *)object sentOutputValue:(id)value
{
    if ([object isEqual:self.distance]) {
        self.distanceLabel.text = [NSString stringWithFormat:@"touch distance from center (points): \n%@",value];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
