//
//  BSDVelocity.m
//  BSDPatchExample
//
//  Created by Travis Henspeter on 8/4/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDVelocity.h"

CGFloat getVector(CGFloat x, CGFloat y){
    
    CGFloat result = sqrt(pow(x, 2) + pow(y, 2));
    return result;
}

@interface BSDVelocity ()

@property (nonatomic)BOOL canReverse;
@property (nonatomic)CGFloat previousAngle;
@property (nonatomic)CGFloat previousVelocity;
@property (nonatomic)CGFloat previousVector;

@end


@implementation BSDVelocity{
    
    UIAccelerationValue gravX;
    UIAccelerationValue gravY;
    UIAccelerationValue gravZ;
    UIAccelerationValue prevVelocity;
    UIAccelerationValue prevAcce;
    CGFloat prevAngle;
    CGFloat prevVector;
    CGFloat axis[2];
    NSInteger direction;
}

- (void)setupWithArguments:(id)arguments
{
    
}

- (id)init
{
    self = [super init];
    
    if (self)
    {
        gravX = gravY = gravZ = prevVelocity = prevAcce = 0.f;
        _canReverse = NO;
        _previousAngle = 0;
        _previousVector = 0;
        axis[0] = 0;
        axis[1] = 0;
        direction = 1;
        
    }
    
    return self;
}

- (UIAccelerationValue)tendToZero:(UIAccelerationValue)value {
    if (value < 0) {
        return ceil(value);
    } else {
        return floor(value);
    }
}

#define kAccelerometerFrequency        50.0 //Hz
#define kFilteringFactor 0.1

- (CGFloat)velocityWithAcceleration:(CMAcceleration)acceleration
{
    
    gravX = (acceleration.x * kFilteringFactor) + (gravX * (1.0 - kFilteringFactor));
    gravY = (acceleration.y * kFilteringFactor) + (gravY * (1.0 - kFilteringFactor));
    gravZ = (acceleration.z * kFilteringFactor) + (gravZ * (1.0 - kFilteringFactor));
    
    UIAccelerationValue accelX = acceleration.x - ( (acceleration.x * kFilteringFactor) + (gravX * (1.0 - kFilteringFactor)) );
    
    UIAccelerationValue accelY = acceleration.y - ( (acceleration.y * kFilteringFactor) + (gravY * (1.0 - kFilteringFactor)) );
    UIAccelerationValue accelZ = acceleration.z - ( (acceleration.z * kFilteringFactor) + (gravZ * (1.0 - kFilteringFactor)) );
    
    accelX *= 9.81f;
    accelY *= 9.81f;
    accelZ *= 9.81f;
    
    CGFloat newAxis[2] = {accelX,accelY};
    CGFloat xDiff = newAxis[0] - axis[0];
    CGFloat yDiff = newAxis[1] - axis[1];
    CGFloat angle = atan(fabsf(xDiff)/fabsf(yDiff + 1e-6));
    
    
    
    UIAccelerationValue vector = sqrt(pow(accelX,2)+pow(accelY,2)+pow(accelZ, 2));
    UIAccelerationValue acce = vector - prevVelocity;
    UIAccelerationValue velocity = (((acce - prevAcce)/2) * (1/kAccelerometerFrequency)) + prevVelocity;
    //NSLog(@"angle: %f",angle);
    //NSLog(@"velocity: %f",velocity);
    
    if (vector < 2)
    {
        self.canReverse = 1;
    }
    
    
    CGFloat deltaAngle = fabsf(angle - self.previousAngle);
    //NSLog(@"a: %f, v: %f, deltaTheta: %f, can reverse: %d",vector,velocity,deltaAngle,self.canReverse);
    
    if ((vector > 5.0f) & (deltaAngle < 0.5) & (self.canReverse==1)){
        
        self.canReverse = 0;
        
        axis[0] = newAxis[0];
        axis[1] = newAxis[1];
        
        self.previousAngle = angle;
    }
    else
    {
        self.canReverse = 1;
    }
    
    prevAcce = acce;
    prevVelocity = velocity;
    self.previousVector = vector;
    
    
    
    
    
    
    return velocity;
}


@end
