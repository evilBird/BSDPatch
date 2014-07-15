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
@property(nonatomic,strong)BSDAverage *average;
@property(nonatomic,strong)BSDStdDev *stddev;
@property(nonatomic,strong)BSDPTest *pTest;

@property(nonatomic,strong)UILabel *distanceLabel;
@property(nonatomic,strong)UILabel *avgDistanceLabel;
@property(nonatomic,strong)UILabel *stddevDistanceLabel;
@property(nonatomic,strong)UIPanGestureRecognizer *gestureRecognizer;

@end

@implementation BSDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //Configure the BSDObjects
    self.distance = [BSDCreate distance];
    //self.average = [BSDCreate average];
    self.average = [[BSDAverage alloc]initWithBufferSize:30];
    //self.stddev = [BSDCreate standardDeviation];
    self.stddev = [[BSDStdDev alloc]initWithBufferSize:30];
    
    self.pTest = [[BSDPTest alloc]initWithSignificanceLevel:0.95 bufferSize:100];
    
    //connect the distance output to average and std dev objects
    [self.distance connectToHot:self.average];
    [self.distance connectToHot:self.stddev];
    [self.distance connectToHot:self.pTest];
    
    //Register as an output user for each
    self.distance.outputUser = self;
    self.average.outputUser = self;
    self.stddev.outputUser = self;
    self.pTest.outputUser = self;

    //Set a reference point for BSDDistance object, from which distance will be measured
    //Arbitrarily we'll use the center of the screen
    [self.distance hot:@[@"x0",@(self.view.center.x)]];
    [self.distance hot:@[@"y0",@(self.view.center.y)]];
    
    
    //Set up our labels, which will display the output from the BSDObjects
    CGPoint origin = self.view.bounds.origin;
    self.distanceLabel = [self newLabelWithOrigin:origin];
    [self.view addSubview:self.distanceLabel];
    origin.y = CGRectGetMaxY(self.distanceLabel.frame);
    self.avgDistanceLabel = [self newLabelWithOrigin:origin];
    [self.view addSubview:self.avgDistanceLabel];
    origin.y = CGRectGetMaxY(self.avgDistanceLabel.frame);
    self.stddevDistanceLabel = [self newLabelWithOrigin:origin];
    [self.view addSubview:self.stddevDistanceLabel];

    //Set up our gesture recognizer, which will feed input to the distance object
    self.gestureRecognizer = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(handlePanGesture:)];
    [self.view addGestureRecognizer:self.gestureRecognizer];

}

- (void)handlePanGesture:(UIPanGestureRecognizer *)sender
{
    CGPoint location = [sender locationInView:self.view];
    
    //Feed the BSDDistance object, which takes an array in the hot inlet. The array consists of a selector(String) and a value. In this case, the strings "xf" and yf" refer to the x and y values, respectively, of the touch location. These strings are used internally by BSDDistance to appropriately route the values.
    [self.distance hot:@[@"xf",@(location.x)]];
    [self.distance hot:@[@"yf",@(location.y)]];
}

#pragma mark - BSDObjectOutputUser method implementation

- (void)BSDObject:(BSDObject *)object sentOutputValue:(id)value
{
    //Get output values from our objects and display them
    NSString *textToDisplay = [NSString stringWithFormat:@"%@: \n%@",object.name,value];
    if ([object isEqual:self.distance]) {
        self.distanceLabel.text = textToDisplay;
    }else if ([object isEqual:self.average]){
        self.avgDistanceLabel.text = textToDisplay;
    }else if ([object isEqual:self.stddev]){
        self.stddevDistanceLabel.text = textToDisplay;
    }else if ([object isEqual:self.pTest]){
        NSInteger significant = [value integerValue];
        [self colors:significant];
    }
}

- (void)colors:(NSInteger)colors
{
    if (!colors) {
        self.view.backgroundColor = [UIColor whiteColor];
        self.distanceLabel.textColor = [UIColor blackColor];
        self.avgDistanceLabel.textColor = [UIColor blackColor];
        self.stddevDistanceLabel.textColor =  [UIColor blackColor];
    }else{
        self.view.backgroundColor = [UIColor blackColor];
        self.distanceLabel.textColor = [UIColor whiteColor];
        self.avgDistanceLabel.textColor = [UIColor whiteColor];
        self.stddevDistanceLabel.textColor =  [UIColor whiteColor];
    }
}

- (UILabel *)newLabelWithOrigin:(CGPoint)origin
{
    CGRect frame;
    frame.origin = origin;
    frame.size.width = CGRectGetWidth(self.view.bounds);
    frame.size.height = CGRectGetHeight(self.view.bounds)/3;
    UILabel *label = [[UILabel alloc]initWithFrame:frame];
    label.textAlignment = NSTextAlignmentCenter;
    label.numberOfLines = 2;
    return label;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
