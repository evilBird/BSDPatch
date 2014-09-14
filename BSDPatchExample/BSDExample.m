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
        [view view].backgroundColor = [UIColor yellowColor];
        UIView *newView = [[UIView alloc]initWithFrame:CGRectMake(30, 30, 200, 200)];
        BSDView *floater = [[BSDView alloc]initWithUIView:newView];
        [view.view addSubview:newView];
        newView.backgroundColor = [UIColor brownColor];
        BSDLayer *layer = [[BSDLayer alloc]initWithCALayer:newView.layer];
        
        BSDMotionGenerator *motionGenerator  = [[BSDMotionGenerator alloc]init];
        BSDAdd *plusX = [[BSDAdd alloc]init];
        plusX.coldInlet.value = @(newView.center.x);
        
        BSDAdd *plusY = [[BSDAdd alloc]init];
        plusY.coldInlet.value = @(newView.center.y);
        
        BSDRoute *motionRouter = [[BSDRoute alloc]initAndConnectWithRouteKeysAndInlets: @{@"x":plusX.hotInlet,
                                                                                          @"y":plusY.hotInlet}];
        
        [motionGenerator.gyroOutlet connectToInlet:motionRouter.hotInlet];
        
        BSDPoint2D *point = [[BSDPoint2D alloc]initWithCGPoint:newView.center];
        
        BSDClipHard *clipX = [[BSDClipHard alloc]initWithMinValue:@(CGRectGetMinX(superview.bounds))
                                                         maxValue:@(CGRectGetMaxX(superview.bounds))];
        BSDClipHard *clipY = [[BSDClipHard alloc]initWithMinValue:@(CGRectGetMinY(superview.bounds))
                                                         maxValue:@(CGRectGetMaxY(superview.bounds))];
        
        [plusX.mainOutlet connectToInlet:clipX.hotInlet];
        [plusY.mainOutlet connectToInlet:clipY.hotInlet];
        
        [clipX.mainOutlet connectToInlet:point.xInlet];
        [clipX.mainOutlet connectToInlet:plusX.coldInlet];
        [clipY.mainOutlet connectToInlet:point.yInlet];
        [clipY.mainOutlet connectToInlet:plusY.coldInlet];
        
        CABasicAnimation *a = [[CABasicAnimation alloc]init];
        a.duration = 0.5;
        a.keyPath = @"position";
        a.fromValue = [NSValue wrapPoint:superview.center];
        a.toValue = [NSValue wrapPoint:superview.center];
        
        BSDAddKey *addKey = [[BSDAddKey alloc]initWithKey:@"toValue"];
        [point.mainOutlet connectToInlet:addKey.hotInlet];
        BSDSpeedLimit *speedLimit = [[BSDSpeedLimit alloc]initWithInterval:@(0.5)];
        [addKey.mainOutlet connectToInlet:speedLimit.hotInlet];

        BSDBasicAnimation *animate = [[BSDBasicAnimation alloc]initWithLayer:newView.layer
                                                                    animation:a];
        [speedLimit.mainOutlet connectToInlet:animate.hotInlet];
        
        [self.subobjects addObjectsFromArray:@[view,floater,motionGenerator,motionRouter,plusX,plusY,point,clipX,clipY,layer,animate,addKey,speedLimit]];
        
        [motionGenerator.hotInlet input:[BSDBang bang]];
        
    }
}

@end
