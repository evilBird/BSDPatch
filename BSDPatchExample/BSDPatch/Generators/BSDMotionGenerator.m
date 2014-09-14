//
//  BSDMotionGenerator.m
//  BSDPatchExample
//
//  Created by Travis Henspeter on 8/4/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDMotionGenerator.h"
#import "BSDPoint2D.h"
@implementation BSDMotionGenerator

- (void)setupWithArguments:(id)arguments
{
    
    self.name = @"MotionGenerator";
    self.accelOutlet = [[BSDOutlet alloc]init];
    self.accelOutlet.name = @"accel";
    self.accelOutlet.value =nil;
    [self addPort:self.accelOutlet];
    
    self.gyroOutlet = [[BSDOutlet alloc]init];
    self.gyroOutlet.name = @"gyro";
    self.gyroOutlet.value = nil;
    [self addPort:self.gyroOutlet];
    
    self.pitchOutlet = [[BSDOutlet alloc]init];
    self.pitchOutlet.name = @"pitch";
    self.pitchOutlet.value = nil;
    [self addPort:self.gyroOutlet];
    
    self.motionManager = [[CMMotionManager alloc] init];
    self.motionManager.accelerometerUpdateInterval = 0.1;

}

- (void)inletReceievedBang:(BSDInlet *)inlet
{
    [self startMotionSensors];
}

- (void)startMotionSensors
{
    
    //start accelerometer
    if (self.motionManager.accelerometerAvailable){
        [self.motionManager startAccelerometerUpdatesToQueue:[NSOperationQueue currentQueue] withHandler:^(CMAccelerometerData  *accelerometerData, NSError *error) {
            [self accelerometerDidAccelerate:accelerometerData.acceleration];
        }];
    }
    
    if (self.motionManager.deviceMotionAvailable){
        __weak BSDMotionGenerator *weakself = self;
        [self.motionManager startDeviceMotionUpdatesToQueue:[NSOperationQueue currentQueue] withHandler:^ (CMDeviceMotion *devMotion, NSError *error){
            
            CMAcceleration currentAcceleration = devMotion.userAcceleration;
            NSDictionary *accelerationDictionary = @{@"x":@(currentAcceleration.x),
                                                     @"y":@(currentAcceleration.y),
                                                     @"z":@(currentAcceleration.z)
                                                     };
            weakself.accelOutlet.value = accelerationDictionary;
            weakself.mainOutlet.value = @{@"acceleration":accelerationDictionary};
            
        }];
    } else {
        NSLog(@"No device motion on device.");
    }
    
    //gyro
    if(self.motionManager.gyroAvailable){
        __weak BSDMotionGenerator *weakself = self;
        [self.motionManager startGyroUpdatesToQueue:[NSOperationQueue mainQueue] withHandler:^(CMGyroData *gyroData, NSError *error) {
            
            NSDictionary *gyroDictionary = @{@"x":@(gyroData.rotationRate.x),
                                             @"y":@(gyroData.rotationRate.y),
                                             @"z":@(gyroData.rotationRate.z)
                                             };
            
            weakself.gyroOutlet.value = gyroDictionary;
            weakself.mainOutlet.value = @{@"gyro":gyroDictionary};
            
        }];
    } else {
        NSLog(@"No gyro info on device.");
    }
}

//called often by accelerometer, package accel values and send to PD
-(void)accelerometerDidAccelerate:(CMAcceleration)acceleration{

    NSDictionary *accelerationDictionary = @{@"x":@(acceleration.x),
                                             @"y":@(acceleration.y),
                                             @"z":@(acceleration.z)
                                             };
    
    self.accelOutlet.value = accelerationDictionary;
    self.mainOutlet.value = @{@"acceleration":accelerationDictionary};
    
}

@end
