//
//  BSDMainPatch.m
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/19/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDReferencePointView.h"

@implementation BSDReferencePointView

- (instancetype)initWithUIView:(UIView *)view
{
    return [super initWithArguments:view];
}

- (void)setupWithArguments:(id)arguments
{
    UIView *aView = (UIView *)arguments;
    
    if (aView) {
        //create a view box
        self.mainView = [BSDCreate viewWithUIView:aView];
        
        //create a rect box
        self.mainViewRect = [BSDCreate rectWithCGRect:aView.frame];
        
        //create a view that will stay in the center
        self.centerView = [[UIView alloc]initWithFrame:aView.bounds];
        self.centerView.backgroundColor = [UIColor blackColor];
        self.centerView.layer.cornerRadius = aView.frame.size.width/2;
        [aView addSubview:self.centerView];
        
        //create a multiply box
        self.times = [BSDCreate multiplyCold:@(2)];
        
        //create a divide box
        self.divide = [BSDCreate divideCold:@(1000)];
        
        //create a swap box & a subtract box to calculate frame origin
        self.swapX = [BSDCreate swapCold:@(aView.center.x)];
        self.minusX = [BSDCreate subtract];
        
        self.swapY = [BSDCreate swapCold:@(aView.center.y)];
        self.minusY = [BSDCreate subtract];
        
        //create a prepend key box for 'frame'
        self.prependFrame = [BSDCreate prependKeyCold:@"frame"];
        
        //create a prepend key box for 'alpha'
        self.prependAlpha = [BSDCreate prependKeyCold:@"alpha"];
        
        //send hot input to the multiply box & swap boxes
        [self.hotInlet forwardToPort:self.times.hotInlet];
        [self.hotInlet forwardToPort:self.swapX.hotInlet];
        [self.hotInlet forwardToPort:self.swapY.hotInlet];
        
        //send product of multiply box to the rect box width & height inlets
        [self.times connect:self.mainViewRect.heightInlet];
        [self.times connect:self.mainViewRect.widthInlet];
        
        //send the outputs of the swap box to the subtract box
        //swap right output goes to subtract cold
        [self.swapX connectOutlet:self.swapX.rightOutlet toInlet:self.minusX.coldInlet];
        [self.swapY connectOutlet:self.swapY.rightOutlet toInlet:self.minusY.coldInlet];
        //swap left output goes to subtract hot
        [self.swapX connectOutlet:self.swapX.leftOutlet toInlet:self.minusX.hotInlet];
        [self.swapY connectOutlet:self.swapY.leftOutlet toInlet:self.minusY.hotInlet];
        
        
        //send the output of the subtract box to the rect box origin inlets
        [self.minusX connect:self.mainViewRect.originXInlet];
        [self.minusY connect:self.mainViewRect.originYInlet];
        
        //send the output of the rect box to the 'frame' prepend key box
        [self.mainViewRect connect:self.prependFrame.hotInlet];
        
        //send the output of the 'frame' prepend key box to the view box
        [self.prependFrame connect:self.mainView.hotInlet];
        
        //send the hot input to a swap box
        self.swapInput = [BSDCreate swapCold:@(1000)];
        [self.hotInlet forwardToPort:self.swapInput.hotInlet];
        
        //send the swapped outlets to the invert input box
        self.invertInput = [BSDCreate subtract];
        [self.swapInput connectOutlet:self.swapInput.rightOutlet toInlet:self.invertInput.coldInlet];
        [self.swapInput connectOutlet:self.swapInput.leftOutlet toInlet:self.invertInput.hotInlet];
        
        //send the inverted input to the divide box to normalize
        [self.invertInput connect:self.divide.hotInlet];
        
        //send the output of the divide box to the 'alpha' prepend key box
        [self.divide connect:self.prependAlpha.hotInlet];
        
        //send the output of the 'alpha' prepend key box to the main view box
        [self.prependAlpha connect:self.mainView.hotInlet];
        
        //set the output block on the view so we can adjust the corner radius
        __weak BSDReferencePointView *weakself = self;
        self.mainView.outputBlock = ^(BSDObject *object, BSDOutlet *outlet){
            UIView *view = outlet.value;
            if (view) {
                view.layer.cornerRadius = view.frame.size.width/2;
                CGPoint center = CGPointMake(CGRectGetMidX(view.bounds), CGRectGetMidY(view.bounds));
                weakself.centerView.center = center;
            }
        };
    }
    

    
}

- (void)calculateOutput
{
    UIView *view = [self view];
    if (view) {
        self.mainOutlet.value = view;
    }
}

- (UIView *)view
{
    return self.mainView.coldInlet.value;
}

@end
