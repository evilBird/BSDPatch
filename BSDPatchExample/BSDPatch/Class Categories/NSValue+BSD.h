//
//  NSValue+BSD.h
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/19/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSValue (BSD)

+ (NSValue *)wrapPoint:(CGPoint)point;
+ (NSValue *)wrapRect:(CGRect)rect;

@end
