//
//  BSDMotionGenerator.h
//  BSDPatchExample
//
//  Created by Travis Henspeter on 8/4/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BSDObject.h"
#import <QuartzCore/QuartzCore.h>
#import <CoreMotion/CoreMotion.h>


@interface BSDMotionGenerator : BSDObject 

@property (strong, nonatomic) CMMotionManager *motionManager;



@end
