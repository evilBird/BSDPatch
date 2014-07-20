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

@interface BSDViewController ()

@property(nonatomic,strong)BSDDistanceFrom2DPoint *d1;
@property(nonatomic,strong)BSDDistanceFrom2DPoint *d2;
@property(nonatomic,strong)BSDIntersect2Circles *i2c;
@property(nonatomic,strong)BSDIntersect2CirclesHelper *d1h;
@property(nonatomic,strong)BSDIntersect2CirclesHelper *d2h;

@property(nonatomic,strong)BSDEstimatedPointView *estPtView1;
@property(nonatomic,strong)BSDEstimatedPointView *estPtView2;
@property(nonatomic,strong)BSDReferencePointView *refPtView1;
@property(nonatomic,strong)BSDReferencePointView *refPtView2;

@property(nonatomic,strong)BSDFormatString *formatString2;
@property(nonatomic,strong)BSDFormatString *formatString3;
@property(nonatomic,strong)BSDLabel *b_label2;
@property(nonatomic,strong)BSDLabel *b_label3;
@property(nonatomic,strong)BSDPrependKey *preprendTextKey2;
@property(nonatomic,strong)BSDPrependKey *prependTextKey3;
@property(nonatomic,strong)BSDRoute *routeText;

@property(nonatomic,strong)UIPanGestureRecognizer *gestureRecognizer;
@property(nonatomic)CGPoint touchLocation;
@property(nonatomic)CGPoint refpt1;
@property(nonatomic)CGPoint refpt2;

@property(nonatomic,strong)UILabel *label1;
@property(nonatomic,strong)UILabel *label2;
@property(nonatomic,strong)UILabel *label3;

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
    BSDRectSplit *split = [[BSDRectSplit alloc]init];
    [split test];
}

- (void)configure
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
    [self.d1 connect:self.d1h.circleRadius];
    
    self.d2 = [BSDCreate distanceFrom2DPointCold:[NSValue wrapPoint:self.refpt2]];
    self.d2h = [BSDCreate intersect2CirclesHelperCold:self.d2.coldInlet.value];
    [self.d2 connect:self.d2h.circleRadius];
    
    //connect helpers to intersect2Circles
    self.i2c = [BSDCreate intersect2Circles];
    [self.d2h connect:self.i2c.circle1];
    [self.d1h connect:self.i2c.circle2];
    
    //create our reference point views and send the distance outputs to them
    
    UIColor *refPtColor = [UIColor colorWithWhite:0.8 alpha:0.5];
    
    self.refPtView1 = [[BSDReferencePointView alloc]initWithUIView:[self newPointWithCenter:self.refpt1
                                                                                      color:refPtColor
                                                                                      alpha:1]];
    self.refPtView2 = [[BSDReferencePointView alloc]initWithUIView:[self newPointWithCenter:self.refpt2
                                                                                      color:refPtColor
                                                                                      alpha:1]];
    
    [self.d1 connect:self.refPtView1.hotInlet];
    [self.d2 connect:self.refPtView2.hotInlet];
    
    //create our estmated point views and send the intersect circles outputs to them
    
    self.estPtView1 = [[BSDEstimatedPointView alloc]initWithUIView:[self newPointWithCenter:self.view.center
                                                                                      color:[UIColor blueColor]
                                                                                      alpha:0]];

    self.estPtView2 = [[BSDEstimatedPointView alloc]initWithUIView:[self newPointWithCenter:self.view.center
                                                                                      color:[UIColor redColor]
                                                                                      alpha:0]];

    [self.i2c connectOutlet:self.i2c.circle1Center toInlet:self.estPtView1.center];
    [self.i2c connectOutlet:self.i2c.circle2Center toInlet:self.estPtView2.center];
    
    NSString *formatString = @"estimated pt %@:\n(%@,%@)";
    
    self.formatString2 = [BSDCreate formatString:formatString];
    self.preprendTextKey2 = [BSDCreate prependKeyCold:@"text"];
    self.b_label2 = [BSDCreate labelWithUILabel:self.label2];
    [self.formatString2 connect:self.preprendTextKey2.hotInlet];
    [self.preprendTextKey2 connect:self.b_label2.hotInlet];
    
    self.formatString3 = [BSDCreate formatString:formatString];
    self.prependTextKey3 = [BSDCreate prependKeyCold:@"text"];
    self.b_label3 = [BSDCreate labelWithUILabel:self.label3];
    [self.formatString3 connect:self.prependTextKey3.hotInlet];
    [self.prependTextKey3 connect:self.b_label3.hotInlet];

    //set completion block to update our labels as the point estimates are updated
    __weak BSDViewController *weakself = self;
    
    self.i2c.outputBlock = ^(BSDObject *object, BSDOutlet *outlet){
        NSDictionary *points = outlet.value;
        
        //CGPoint actualPt = weakself.touchLocation;
        //weakself.label1.text = [NSString stringWithFormat:@"actual touch location:\n(%.1f, %.1f)",actualPt.x,actualPt.y];
        if (points) {
            CGPoint i = [points[@"i"] CGPointValue];
            CGPoint j = [points[@"j"] CGPointValue];
            [weakself.estPtView1.alpha input:@(1)];
            [weakself.estPtView2.alpha input:@(1)];
            [weakself.formatString2.hotInlet input:@[@"i", @((int)i.x),@((int)i.y)]];
            [weakself.formatString3.hotInlet input:@[@"j", @((int)j.x),@((int)j.y)]];
            weakself.label2.textColor = [[weakself.estPtView1 view]backgroundColor];
            weakself.label3.textColor = [[weakself.estPtView2 view]backgroundColor];
        }else{
            [weakself.estPtView1.alpha input:@(0)];
            [weakself.estPtView2.alpha input:@(0)];
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
    UIColor *refPtColor = [UIColor colorWithWhite:0.8 alpha:0.5];
    
    UIView *refPtView1 = [self newPointWithCenter:self.refpt1 color:refPtColor alpha:1.0];
    
    UIView *refPtView2 = [self newPointWithCenter:self.refpt2 color:refPtColor alpha:1.0];
    
    self.refPtView1 = [[BSDReferencePointView alloc]initWithUIView:refPtView1];
    [self.d1 connect:self.refPtView1.hotInlet];
    self.refPtView2 = [[BSDReferencePointView alloc]initWithUIView:refPtView2];
    [self.d2 connect:self.refPtView2.hotInlet];
    
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
    self.label1.text = @"";
    self.label2.text = @"";
    self.label3.text = @"";
    [self.estPtView1.alpha input:@(0)];
    [self.estPtView2.alpha input:@(0)];
}

- (void)setTouchLocation:(CGPoint)touchLocation
{
    _touchLocation = touchLocation;
    
    //feed the touch location to the distance objects
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
