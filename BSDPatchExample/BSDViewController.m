//
//  BSDViewController.m
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/14/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDViewController.h"
#import "BSDPatch.h"
#import "BSDTestVariable.h"

@interface BSDViewController ()

@property(nonatomic,strong)BSDDistance *distance;
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
    //distance object will measure the distance between touches in the view
    self.distance = [BSDCreate distance];
    //p-test will take the output of the distance object and calculate the mean, standard deviation, and p-value of the value (alpha = 0.05, n = 256). If the average distances changes significantly, the screen will turn blue.
    self.pTest = [[BSDPTest alloc]initWithSignificanceLevel:0.95 bufferSize:256];
    
    //connect the distance output to p-test object
    [self.distance connect:self.pTest.hotInlet];

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
    self.view.multipleTouchEnabled = YES;
    
    __weak BSDViewController *WEAK_SELF = self;
    self.distance.mainOutlet.outputBlock = ^(BSDObject *object, BSDOutlet *outlet){
        WEAK_SELF.distanceLabel.text = [outlet.value stringValue];
    };
    
    self.pTest.mainOutlet.outputBlock = ^(BSDObject *object, BSDOutlet *outlet){
        [WEAK_SELF indicateSignificance:[object.mainOutlet.value boolValue]];
    };
    
    [self test];

}
- (void)test
{
    BSDAdd *add = [BSDCreate add];
    add.coldInlet.value = @(1);
    BSDMultiply *mult = [BSDCreate multiply];
    mult.outputBlock = ^(BSDObject *object, BSDOutlet *outlet){
        
        NSLog(@"mult val : %@",outlet.value);
    };
    
    BSDSequence *sequence = [BSDCreate sequence:@[mult.coldInlet,mult.hotInlet]];
    [add connect:sequence.hotInlet];
    
    [add.hotInlet input:@(1)];
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self handleTouches:touches];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self handleTouches:touches];
}

- (void)handleTouches:(NSSet *)touches
{
    //Feed the BSDDistance object, which takes an array in the hot inlet. The array consists of a selector(String) and a value. In this case, the strings "xf" and yf" refer to the x and y values, respectively, of the touch location. These strings are used internally by BSDDistance to appropriately route the values.
    
    if (touches.count == 2) {
        //Set a reference point for BSDDistance object, from which distance will be measured
        CGPoint ref = [touches.allObjects[0] locationInView:self.view];
        [self.distance.hotInlet input:@[@"x0",@(ref.x)]];
        [self.distance.hotInlet input:@[@"y0",@(ref.y)]];
        CGPoint pt = [touches.allObjects[1] locationInView:self.view];
        [self.distance.hotInlet input:@[@"xf",@(pt.x)]];
        [self.distance.hotInlet input:@[@"yf",@(pt.y)]];
    }
}

#pragma mark - Convenience methods

- (void)indicateSignificance:(BOOL)significant
{
    if (significant) {
        self.view.backgroundColor = [UIColor blueColor];
    }else{
        self.view.backgroundColor = [UIColor whiteColor];
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
