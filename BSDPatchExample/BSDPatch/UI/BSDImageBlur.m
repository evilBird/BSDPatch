//
//  BSDImageBlur.m
//  VideoBlurExample
//
//  Created by Travis Henspeter on 8/13/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDImageBlur.h"

@implementation BSDImageBlur



- (instancetype)initWithBlurRadius:(NSNumber *)blurRadius saturation:(NSNumber*)saturation
{
    return [super initWithArguments:@{@"radius":blurRadius,
                                      @"saturation":saturation
                                      }];
}

- (void)setupWithArguments:(id)arguments
{
    self.name = @"image blur";
    NSDictionary *args = arguments;
    if (args) {
        self.parameters = [NSMutableDictionary dictionaryWithDictionary:args];
    }
}

- (void)calculateOutput
{
    NSDictionary *args = self.coldInlet.value;
    
    if (args) {
        [self updateParametersWithArgs:args];
    }
    
    UIImage *image = self.hotInlet.value;

    if (image && self.parameters) {
        
        NSNumber *blurRadius = self.parameters[@"radius"];
        self.mainOutlet.value = [HBVImageBlur applyBlurType:HBVImageBlurTypevImage
                                                    onImage:image withRadius:blurRadius.floatValue];
        
    }
    
    
}

- (void)updateParametersWithArgs:(NSDictionary *)args
{
    for (id key in args.allKeys) {
        self.parameters[key] = args[key];
    }
    
    self.coldInlet.value = nil;
}

@end
