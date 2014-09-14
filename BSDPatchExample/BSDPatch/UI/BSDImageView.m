//
//  BSDImageView.m
//  VideoBlurExample
//
//  Created by Travis Henspeter on 8/13/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDImageView.h"

@implementation BSDImageView

- (instancetype)initWithUIImageView:(UIImageView *)imageView;
{
    return [super initWithArguments:imageView];
}

- (void)setupWithArguments:(id)arguments
{
    self.name = @"image view";
    UIImageView *imageView = (UIImageView *)arguments;
    
    if (imageView) {
        self.coldInlet.value = imageView;
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
        UIImageView *view = [self imageView];
        NSString *keyPath = inlet.value;
        self.getterOutlet.value = [view valueForKeyPath:keyPath];
    }
}


- (UIImageView *)imageView
{
    return self.coldInlet.value;
}

@end
