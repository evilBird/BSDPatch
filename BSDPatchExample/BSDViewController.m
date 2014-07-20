//
//  BSDViewController.m
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/14/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDViewController.h"
#import "BSDPatch.h"
#import "BSDCircleView.h"

@interface BSDViewController ()

//test 1
@property(nonatomic,strong)BSDDistanceFrom2DPoint *d1;
@property(nonatomic,strong)BSDDistanceFrom2DPoint *d2;
@property(nonatomic,strong)BSDIntersect2Circles *i2c;
@property(nonatomic,strong)BSDIntersect2CirclesHelper *d1h;
@property(nonatomic,strong)BSDIntersect2CirclesHelper *d2h;

@property(nonatomic,strong)UIView *iv;
@property(nonatomic,strong)UIView *jv;

@property(nonatomic,strong)BSDCircleView *circleView1;
@property(nonatomic,strong)BSDCircleView *circleView2;

@property(nonatomic)CGPoint touchLocation;
@property(nonatomic)CGPoint refpt1;
@property(nonatomic)CGPoint refpt2;
@property(nonatomic,strong)UILabel *label1;
@property(nonatomic,strong)UILabel *label2;
@property(nonatomic,strong)UILabel *label3;
@property(nonatomic,strong)UIPanGestureRecognizer *gestureRecognizer;

@end

@implementation BSDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self test1];
    [self test2];


}

- (void)test1
{
    //Set up our labels, which will display the output from the BSDObjects
    [self addLabels];
    
    //Set up our gesture recognizer, which will feed input to the distance object
    self.view.multipleTouchEnabled = YES;
    
    //reference points
    self.refpt1 = self.view.bounds.origin;
    self.refpt2 = CGPointMake(CGRectGetMaxX(self.view.bounds), CGRectGetMaxY(self.view.bounds));

    //set up distance measurement objects & helpers
    self.d1 = [BSDCreate distanceFrom2DPointCold:[NSValue wrapPoint:self.refpt1]];
    self.d1h = [BSDCreate intersect2CirclesHelperCold:self.d1.coldInlet.value];
    [self.d1 connect:self.d1h.hotInlet];
    
    self.d2 = [BSDCreate distanceFrom2DPointCold:[NSValue wrapPoint:self.refpt2]];
    self.d2h = [BSDCreate intersect2CirclesHelperCold:self.d2.coldInlet.value];
    [self.d2 connect:self.d2h.hotInlet];
    
    //connect helpers to intersect2Circles
    self.i2c = [BSDCreate intersect2Circles];
    [self.d2h connect:self.i2c.coldInlet];
    [self.d1h connect:self.i2c.hotInlet];
    
    //add views to show the estimated points
    self.iv = [self newPointWithColor:[UIColor blueColor]];
    [self.view addSubview:self.iv];
    self.jv = [self newPointWithColor:[UIColor redColor]];
    [self.view addSubview:self.jv];
    
    //set completion block to update our views & labels as the point estimates are updated
    __weak BSDViewController *weakself = self;
    
    self.i2c.outputBlock = ^(BSDObject *object, BSDOutlet *outlet){
        NSDictionary *points = outlet.value;
        CGPoint actualPt = weakself.touchLocation;
        weakself.label1.text = [NSString stringWithFormat:@"actual touch location:\n(%.1f, %.1f)",actualPt.x,actualPt.y];
        if (points) {
            CGPoint i = [points[@"i"] CGPointValue];
            CGPoint j = [points[@"j"] CGPointValue];
            weakself.iv.center = i;
            weakself.iv.alpha = 1;
            weakself.jv.center = j;
            weakself.jv.alpha = 1;
            weakself.label2.text = [NSString stringWithFormat:@"est. touch location i:\n(%.1f, %.1f)",i.x,i.y];
            weakself.label2.textColor = weakself.iv.backgroundColor;
            weakself.label3.text = [NSString stringWithFormat:@"est. touch location j:\n(%.1f, %.1f)",j.x,i.y];
            weakself.label3.textColor = weakself.jv.backgroundColor;
        }else{
            weakself.iv.alpha = 0;
            weakself.jv.alpha = 0;
            weakself.label2.text = @"cannot locate touch";
            weakself.label2.textColor = [UIColor blackColor];
            weakself.label3.text = @"cannot locate touch";
            weakself.label3.textColor = [UIColor blackColor];
        }
    };
}

- (void)test2
{
    //create views to pass to our circle view objects
    UIColor *circleColor = [UIColor colorWithWhite:0.8 alpha:0.5];
    
    UIView *circleView1 = [self newPointWithColor:circleColor];
    circleView1.center = self.refpt1;
    [self.view insertSubview:circleView1 atIndex:0];
    
    UIView *circleView2 = [self newPointWithColor:circleColor];
    circleView2.center = self.refpt2;
    [self.view insertSubview:circleView2 atIndex:0];
    
    self.circleView1 = [[BSDCircleView alloc]initWithUIView:circleView1];
    [self.d1 connect:self.circleView1.hotInlet];
    self.circleView2 = [[BSDCircleView alloc]initWithUIView:circleView2];
    [self.d2 connect:self.circleView2.hotInlet];
    
}

#pragma mark - handle touches

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    //Feed the distance objects
    if (touches.count == 1){
        self.touchLocation = [touches.allObjects.firstObject locationInView:self.view];
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    //Feed the distance objects
    if (touches.count == 1){
        self.touchLocation = [touches.allObjects.firstObject locationInView:self.view];
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    self.iv.alpha = 0;
    self.jv.alpha = 0;
    self.label1.text = @"";
    self.label2.text = @"";
    self.label3.text = @"";
}

- (void)setTouchLocation:(CGPoint)touchLocation
{
    _touchLocation = touchLocation;
    
    [self.d1.hotInlet input:[NSValue wrapPoint:touchLocation]];
    [self.d2.hotInlet input:[NSValue wrapPoint:touchLocation]];
}

#pragma mark - Convenience methods

- (void)addLabels
{
    CGPoint origin = self.view.bounds.origin;
    self.label1 = [self newLabelWithOrigin:origin];
    [self.view addSubview:self.label1];
    origin.y = CGRectGetMaxY(self.label1.frame);
    self.label2 = [self newLabelWithOrigin:origin];
    [self.view addSubview:self.label2];
    origin.y = CGRectGetMaxY(self.label2.frame);
    self.label3 = [self newLabelWithOrigin:origin];
    [self.view addSubview:self.label3];
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

- (UIView *)newPointWithColor:(UIColor *)color
{
    CGRect frame = CGRectMake(0, 0, 44, 44);
    UIView *point = [[UIView alloc]initWithFrame:frame];
    point.layer.cornerRadius = frame.size.width/2;
    point.backgroundColor = color;
    point.alpha = 0.0;
    
    return point;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
