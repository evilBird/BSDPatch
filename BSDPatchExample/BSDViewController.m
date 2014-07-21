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

@property(nonatomic,strong)BSDTouchGenerator *touchGenerator;
@property(nonatomic,strong)BSDDictionaryDrip *touchDrip;
@property(nonatomic,strong)BSDRoute *touchRoute;
@property(nonatomic,strong)BSDSequence *touchSequence;

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



@end

@implementation BSDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    //define reference points
    self.refpt1 = self.view.bounds.origin;
    self.refpt2 = CGPointMake(CGRectGetMinX(self.view.bounds), CGRectGetMaxY(self.view.bounds));

    
    [self configure];
    [self test];
}

- (void)test
{

}

- (void)configure
{
    //set up distance measurement objects & helpers, one for each point
    self.distanceFromRefPt1 = [BSDCreate distanceFrom2DPointCold:[NSValue wrapPoint:self.refpt1]];
    self.distance1Helper = [BSDCreate intersect2CirclesHelperCold:self.distanceFromRefPt1.coldInlet.value];
    [self.distanceFromRefPt1 connect:self.distance1Helper.circleRadius];
    
    self.distanceFromRefPt2 = [BSDCreate distanceFrom2DPointCold:[NSValue wrapPoint:self.refpt2]];
    self.distance2Helper = [BSDCreate intersect2CirclesHelperCold:self.distanceFromRefPt2.coldInlet.value];
    [self.distanceFromRefPt2 connect:self.distance2Helper.circleRadius];
    
    //create our reference point views and send the distance outputs to them
    UIColor *refPtColor = [UIColor colorWithWhite:0.8 alpha:0.7];
    
    self.refPtView1 = [[BSDReferencePointView alloc]initWithUIView:[BSDEstimatedPointView newPointViewWithCenter:self.refpt1
                                                                                                           color:refPtColor
                                                                                                           alpha:1]];
    [self.view addSubview:self.refPtView1.view];
    self.refPtView2 = [[BSDReferencePointView alloc]initWithUIView:[BSDEstimatedPointView newPointViewWithCenter:self.refpt2
                                                                                                           color:refPtColor
                                                                                                           alpha:1]];
    [self.view addSubview:self.refPtView2.view];
    
    [self.distanceFromRefPt1 connect:self.refPtView1.hotInlet];
    [self.distanceFromRefPt2 connect:self.refPtView2.hotInlet];
    
    //connect distance helper outputs to intersect2Circles, which will provide point estimates based on the distances and reference points it receives
    self.intersect2circles = [BSDCreate intersect2Circles];
    [self.distance2Helper connect:self.intersect2circles.circle1];
    [self.distance1Helper connect:self.intersect2circles.circle2];
    
    //create estmated point views and send the intersect circles outputs to them
    self.estPtView_i = [[BSDEstimatedPointView alloc]initWithUIView:[BSDEstimatedPointView newPointViewWithCenter:self.view.center
                                                                                                            color:[UIColor blueColor]
                                                                                                            alpha:1]];
    [self.view addSubview:self.estPtView_i.view];

    self.estPtView_j = [[BSDEstimatedPointView alloc]initWithUIView:[BSDEstimatedPointView newPointViewWithCenter:self.view.center
                                                                                                            color:[UIColor redColor]
                                                                                                            alpha:1]];
    [self.view addSubview:self.estPtView_j.view];

    [self.intersect2circles connectOutlet:self.intersect2circles.circle1Center toInlet:self.estPtView_i.center];
    [self.intersect2circles connectOutlet:self.intersect2circles.circle2Center toInlet:self.estPtView_j.center];
    
    //set up estimated point labels, which will display the coordinates of the estimated points
    
    CGRect frame = self.view.bounds;
    frame.size.height *= 0.5;
    
    UILabel *label_i = [BSDEstimatedPointLabel newLabelWithFrame:frame textColor:[UIColor blueColor]];
    self.estPtLab_i = [[BSDEstimatedPointLabel alloc]initWithUILabel:label_i pointName:@"i"];
    [self.view addSubview:self.estPtLab_i.label];
    
    frame.origin.y = CGRectGetMaxY(frame);
    
    UILabel *label_j = [BSDEstimatedPointLabel newLabelWithFrame:frame textColor:[UIColor redColor]];
    self.estPtLab_j = [[BSDEstimatedPointLabel alloc]initWithUILabel:label_j pointName:@"j"];
    [self.view addSubview:self.estPtLab_j.label];
    
    //route the outputs of the intersect2cirlces object to the appropriate labels
    self.route = [BSDCreate routeWithKeys:@[@"i",@"j"] toInlets:@[self.estPtLab_i.estimatedPointInlet,self.estPtLab_j.estimatedPointInlet]];
    self.drip = [[BSDDictionaryDrip alloc]init];
    [self.drip connect:self.route.hotInlet];
    [self.intersect2circles connect:self.drip.hotInlet];
    
    self.touchGenerator = [[BSDTouchGenerator alloc]initWithArguments:self.view];
    self.touchDrip = [[BSDDictionaryDrip alloc]init];
    [self.touchGenerator connect:self.touchDrip.hotInlet];
    self.touchSequence = [BSDCreate sequenceInlets:@[self.distanceFromRefPt1.hotInlet,self.distanceFromRefPt2.hotInlet]];
    self.touchRoute = [BSDCreate routeWithKeys:@[@"location"] toInlets:@[self.touchSequence.hotInlet]];
    [self.touchDrip connect:self.touchRoute.hotInlet];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
