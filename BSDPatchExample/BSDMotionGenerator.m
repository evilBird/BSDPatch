//
//  BSDMotionGenerator.m
//  BSDPatchExample
//
//  Created by Travis Henspeter on 8/4/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDMotionGenerator.h"

@implementation BSDMotionGenerator

- (void)setupWithArguments:(id)arguments
{
    


}

- (void)configureMotionSensors
{
    self.motionManager = [[CMMotionManager alloc] init];
    self.motionManager.accelerometerUpdateInterval = 0.1;
    
    //start accelerometer
    if (self.motionManager.accelerometerAvailable){
        [self.motionManager startAccelerometerUpdatesToQueue:[NSOperationQueue currentQueue] withHandler:^(CMAccelerometerData  *accelerometerData, NSError *error) {
            [self accelerometerDidAccelerate:accelerometerData.acceleration];
        }];
    }
    
    
    if (self.motionManager.deviceMotionAvailable){
        
        [self.motionManager startDeviceMotionUpdatesToQueue:[NSOperationQueue currentQueue] withHandler:^ (CMDeviceMotion *devMotion, NSError *error){
            
            //HBVVelocityCalculator *velocityCalculator = [[HBVVelocityCalculator alloc]init];
            CMAcceleration currentAcceleration = devMotion.userAcceleration;
            
            //CGFloat velocity = [velocityCalculator velocityWithAcceleration:currentAcceleration];

            
        }];
    } else {
        NSLog(@"No device motion on device.");
    }
    
    //gyro
    if(self.motionManager.gyroAvailable){
        [self.motionManager startGyroUpdatesToQueue:[NSOperationQueue mainQueue] withHandler:^(CMGyroData *gyroData, NSError *error) {
            
            NSArray* gyroArray=[NSArray arrayWithObjects:[NSNumber numberWithFloat:gyroData.rotationRate.x],[NSNumber numberWithFloat:gyroData.rotationRate.y], [NSNumber numberWithFloat:gyroData.rotationRate.z], nil];
            
        }];
    } else {
        NSLog(@"No gyro info on device.");
    }
}

//called often by accelerometer, package accel values and send to PD
-(void)accelerometerDidAccelerate:(CMAcceleration)acceleration{
    //first, "cook" the values to get a nice tilt value without going beyond -1 to 1
    
    //printf("\naccel %.2f %.2f %.2f", acceleration.x, acceleration.y, acceleration.z);
    float cookedX = acceleration.x;
    float cookedY = acceleration.y;
    //cook it via Z accel to see when we have tipped it beyond 90 degrees
    
    if(acceleration.x>0 && acceleration.z>0) cookedX=(2-acceleration.x); //tip towards long side
    else if(acceleration.x<0 && acceleration.z>0) cookedX=(-2-acceleration.x); //tip away long side
    
    if(acceleration.y>0 && acceleration.z>0) cookedY=(2-acceleration.y); //tip right
    else if(acceleration.y<0 && acceleration.z>0) cookedY=(-2-acceleration.y); //tip left
    
    //clip
    if(cookedX<-1)cookedX=-1;
    else if(cookedX>1)cookedX=1;
    if(cookedY<-1)cookedY=-1;
    else if(cookedY>1)cookedY=1;
    
    //send the cooked values as "tilts", and the raw values as "accel"
    
    NSArray* msgArray=[NSArray arrayWithObjects:[NSNumber numberWithFloat:cookedX],[NSNumber numberWithFloat:cookedY], nil];
    
    
    NSArray* accelArray=[NSArray arrayWithObjects:[NSNumber numberWithFloat:acceleration.x],[NSNumber numberWithFloat:acceleration.y], [NSNumber numberWithFloat:acceleration.z], nil];
        
}

@end
