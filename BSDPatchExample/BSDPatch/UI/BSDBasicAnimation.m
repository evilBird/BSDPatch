//
//  BSDLayerAnimation.m
//  BSDPatchExample
//
//  Created by Travis Henspeter on 8/5/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDBasicAnimation.h"
#import "BSDCreate.h"

@interface BSDBasicAnimation ()

@property (nonatomic,strong)BSDRoute *route;
@property (nonatomic,strong)BSDArrayAccum *arrayAccum;
@property (nonatomic,strong)NSMutableDictionary *animationDictionary;

@end

@implementation BSDBasicAnimation

- (instancetype)initWithLayer:(CALayer *)layer animation:(CABasicAnimation *)animation
{
    return [super initWithArguments:@{@"layer":layer,
                                      @"animation":animation,
                                      }];
}

- (void)setupWithArguments:(id)arguments
{
    self.name = @"layer animation";
    self.animationDictionary = [[NSMutableDictionary alloc]init];
    
    NSDictionary *args = arguments;
    
    if (args) {
        
        self.coldInlet.value = args[@"layer"];
        CABasicAnimation *animation = args[@"animation"];
        self.animationDictionary[@"fromValue"] = animation.fromValue;
        self.animationDictionary[@"toValue"] = animation.toValue;
        self.animationDictionary[@"duration"] = @(animation.duration);
        self.animationDictionary[@"keyPath"] = animation.keyPath;
    }
    
}

- (void)calculateOutput
{
    NSDictionary *dictionary = self.hotInlet.value;
    if (dictionary) {
        CALayer *layer = [self layer];
        CABasicAnimation *a = [self updateAnimation:dictionary];
        [layer addAnimation:a forKey:@"a"];
        [layer setValue:a.toValue forKey:a.keyPath];
        [self.animationDictionary setValue:a.toValue forKey:@"fromValue"];
    }
}

- (CALayer *)layer
{
    return self.coldInlet.value;
}

- (CABasicAnimation *)updateAnimation:(NSDictionary *)dictionary
{
    for (id aKey in dictionary.allKeys) {
        self.animationDictionary[aKey] = dictionary[aKey];
    }
    
    CABasicAnimation *animation = [[CABasicAnimation alloc]init];
    
    for (id aKey in self.animationDictionary) {
        [animation setValue:self.animationDictionary[aKey] forKey:aKey];
    }
    
    return animation;
}

@end
