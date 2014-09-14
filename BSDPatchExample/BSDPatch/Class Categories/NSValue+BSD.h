//
//  NSValue+BSD.h
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/19/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreMotion/CoreMotion.h>
#import "NSValue+BSD.h"
#import "BSDPoint3D.h"

@interface NSValue (BSD)
//wrap C structs in an instance of NSValue;

+ (NSValue *)wrapPoint:(CGPoint)point;
+ (NSValue *)wrapRect:(CGRect)rect;
+ (NSValue *)wrap3DTransform:(CATransform3D)transform;
+ (NSValue *)wrapAffineTransform:(CGAffineTransform)transform;

@end
