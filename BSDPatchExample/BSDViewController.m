//
//  BSDViewController.m
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/14/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDViewController.h"
#import "BSDPatch.h"
#import "BSDReferencePointView.h"
#import "BSDEstimatedPointView.h"
#import "BSDEstimatedPointLabel.h"

@interface BSDViewController ()

//reference points
@property(nonatomic)CGPoint refpt1;
@property(nonatomic)CGPoint refpt2;

@property(nonatomic,strong)BSDReferencePointView *refPtView1;
@property(nonatomic,strong)BSDReferencePointView *refPtView2;

@property(nonatomic,strong)BSDDistanceFrom2DPoint *distanceFromRefPt1;
@property(nonatomic,strong)BSDIntersect2CirclesHelper *distance1Helper;

@property(nonatomic,strong)BSDDistanceFrom2DPoint *distanceFromRefPt2;
@property(nonatomic,strong)BSDIntersect2CirclesHelper *distance2Helper;

@property(nonatomic,strong)BSDIntersect2Circles *intersect2circles;

@property(nonatomic,strong)BSDEstimatedPointView *estPtView_i;
@property(nonatomic,strong)BSDEstimatedPointView *estPtView_j;

@property(nonatomic,strong)BSDEstimatedPointLabel *estPtLab_i;
@property(nonatomic,strong)BSDEstimatedPointLabel *estPtLab_j;

@property(nonatomic,strong)BSDDictionaryDrip *drip;
@property(nonatomic,strong)BSDRoute *route;

@property(nonatomic,strong)UIPanGestureRecognizer *gestureRecognizer;
@property(nonatomic)CGPoint touchLocation;


@property(nonatomic,strong)UILabel *label1;


@end

@implementation BSDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self configure];
    [self test];
}

- (void)test
{


}

- (void)configure
{
    
    //Set up our gesture recognizer, which will feed input to the distance object
    self.view.multipleTouchEnabled = YES;
    
    //define reference points
    self.refpt1 = self.view.bounds.origin;
    self.refpt2 = CGPointMake(CGRectGetMaxX(self.view.bounds), CGRectGetMaxY(self.view.bounds));

    //set up distance measurement objects & helpers, one for each point
    self.distanceFromRefPt1 = [BSDCreate distanceFrom2DPointCold:[NSValue wrapPoint:self.refpt1]];
    self.distance1Helper = [BSDCreate intersect2CirclesHelperCold:self.distanceFromRefPt1.coldInlet.value];
    [self.distanceFromRefPt1 connect:self.distance1Helper.circleRadius];
    
    self.distanceFromRefPt2 = [BSDCreate distanceFrom2DPointCold:[NSValue wrapPoint:self.refpt2]];
    self.distance2Helper = [BSDCreate intersect2CirclesHelperCold:self.distanceFromRefPt2.coldInlet.value];
    [self.distanceFromRefPt2 connect:self.distance2Helper.circleRadius];
    
    //create our reference point views and send the distance outputs to them
    UIColor *refPtColor = [UIColor colorWithWhite:0.8 alpha:0.5];
    
    self.refPtView1 = [[BSDReferencePointView alloc]initWithUIView:[self newPointWithCenter:self.refpt1
                                                                                      color:refPtColor
                                                                                      alpha:1]];
    self.refPtView2 = [[BSDReferencePointView alloc]initWithUIView:[self newPointWithCenter:self.refpt2
                                                                                      color:refPtColor
                                                                                      alpha:1]];
    
    [self.distanceFromRefPt1 connect:self.refPtView1.hotInlet];
    [self.distanceFromRefPt2 connect:self.refPtView2.hotInlet];
    
    //connect distance helper outputs to intersect2Circles, which will provide point estimates based on the distances and reference points it receives
    self.intersect2circles = [BSDCreate intersect2Circles];
    [self.distance2Helper connect:self.intersect2circles.circle1];
    [self.distance1Helper connect:self.intersect2circles.circle2];
    
    //create estmated point views and send the intersect circles outputs to them
    self.estPtView_i = [[BSDEstimatedPointView alloc]initWithUIView:[self newPointWithCenter:self.view.center
                                                                                      color:[UIColor blueColor]
                                                                                      alpha:0]];

    self.estPtView_j = [[BSDEstimatedPointView alloc]initWithUIView:[self newPointWithCenter:self.view.center
                                                                                      color:[UIColor redColor]
                                                                                      alpha:0]];

    [self.intersect2circles connectOutlet:self.intersect2circles.circle1Center toInlet:self.estPtView_i.center];
    [self.intersect2circles connectOutlet:self.intersect2circles.circle2Center toInlet:self.estPtView_j.center];
    
    //set up estimated point labels, which will display the coordinates of the estimated points
    
    CGPoint point = self.view.bounds.origin;
    
    self.estPtLab_i = [[BSDEstimatedPointLabel alloc]initWithUILabel:[self newLabelWithOrigin:point]
                                                         pointName:@"i"];
    point.y = CGRectGetMidY(self.view.bounds);
    
    self.estPtLab_j = [[BSDEstimatedPointLabel alloc]initWithUILabel:[self newLabelWithOrigin:point]
                                                         pointName:@"j"];
    
    //route the outputs of the intersect2cirlces object to the appropriate labels
    self.route = [BSDCreate routeWithKeys:@[@"i",@"j"] toInlets:@[self.estPtLab_i.estimatedPointInlet,self.estPtLab_j.estimatedPointInlet]];
    self.drip = [[BSDDictionaryDrip alloc]init];
    [self.drip connect:self.route.hotInlet];
    [self.intersect2circles connect:self.drip.hotInlet];

}

#pragma mark - handle touches

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    //Feed the distance objects
    self.touchLocation = [touches.allObjects.firstObject locationInView:self.view];
    [self.estPtView_i.alpha input:@(1)];
    [self.estPtView_j.alpha input:@(1)];
    [self.estPtLab_i.hotInlet input:@{@"alpha":@(1)}];
    [self.estPtLab_j.hotInlet input:@{@"alpha":@(1)}];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    //Feed the distance objects
    self.touchLocation = [touches.allObjects.firstObject locationInView:self.view];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.estPtView_i.alpha input:@(0)];
    [self.estPtView_j.alpha input:@(0)];
    [self.estPtLab_i.hotInlet input:@{@"alpha":@(0)}];
    [self.estPtLab_j.hotInlet input:@{@"alpha":@(0)}];

}

- (void)setTouchLocation:(CGPoint)touchLocation
{
    _touchLocation = touchLocation;
    
    //feed the touch location to the distance objects
    [self.distanceFromRefPt1.hotInlet input:[NSValue wrapPoint:touchLocation]];
    [self.distanceFromRefPt2.hotInlet input:[NSValue wrapPoint:touchLocation]];
}

#pragma mark - Convenience methods


- (UILabel *)newLabelWithOrigin:(CGPoint)origin
{
    CGRect frame;
    frame.origin = origin;
    frame.size.width = CGRectGetWidth(self.view.bounds);
    frame.size.height = CGRectGetHeight(self.view.bounds)/4;
    UILabel *label = [[UILabel alloc]initWithFrame:frame];
    label.textAlignment = NSTextAlignmentCenter;
    label.numberOfLines = 2;
    [self.view addSubview:label];
    return label;
}

- (UIView *)newPointWithCenter:(CGPoint)center color:(UIColor *)color alpha:(CGFloat)alpha
{
    CGRect frame = CGRectMake(0, 0, 44, 44);
    UIView *point = [[UIView alloc]initWithFrame:frame];
    point.layer.cornerRadius = frame.size.width/2;
    point.backgroundColor = color;
    point.alpha = alpha;
    point.center = center;
    [self.view addSubview:point];
    
    return point;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
