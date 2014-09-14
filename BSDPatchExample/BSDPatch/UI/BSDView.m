//
//  BSDView.m
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/19/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDView.h"

@implementation BSDView

- (instancetype)initWithUIView:(UIView *)view
{
    return [super initWithArguments:view];
}

- (void)setupWithArguments:(id)arguments
{
    self.name = @"view";
    UIView *view = (UIView *)arguments;
    if (view) {
        self.coldInlet.value = view;
    }
    
    self.getterInlet = [[BSDInlet alloc]init];
    self.getterInlet.name = @"getter inlet";
    self.getterInlet.hot = YES;
    [self addPort:self.getterInlet];
    
    self.getterOutlet = [[BSDOutlet alloc]init];
    self.getterOutlet.name = @"getter outlet";
    [self addPort:self.getterOutlet];
    
}

- (void)inletReceievedBang:(BSDInlet *)inlet
{
    if (inlet == self.hotInlet) {
        [self hotInlet:self.hotInlet receivedValue:self.hotInlet.value];
    }
}

- (void)hotInlet:(BSDInlet *)inlet receivedValue:(id)value
{
    if (inlet == self.hotInlet) {
        NSDictionary *hot = self.hotInlet.value;
        UIView *cold = self.coldInlet.value;
        
        if (hot && cold) {
            for (NSString *aKey in hot.allKeys) {
                [cold setValue:hot[aKey] forKey:aKey];
            }
            
            self.mainOutlet.value = self.coldInlet.value;
        }
    }else if (inlet == self.getterInlet){
        UIView *view = [self view];
        NSString *keyPath = inlet.value;
        self.getterOutlet.value = [view valueForKeyPath:keyPath];
    }
}


- (UIView *)view
{
    return self.coldInlet.value;
}




@end
