//
//  BSDDistanceToCoordinate.m
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/19/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDIntersect2Circles.h"
#import "BSDCreate.h"

int circle_circle_intersection(double x0, double y0, double r0,
                               double x1, double y1, double r1,
                               double *xi, double *yi,
                               double *xi_prime, double *yi_prime)
{
    double a, dx, dy, d, h, rx, ry;
    double x2, y2;
    
    /* dx and dy are the vertical and horizontal distances between
     * the circle centers.
     */
    dx = x1 - x0;
    dy = y1 - y0;
    
    /* Determine the straight-line distance between the centers. */
    //d = sqrt((dy*dy) + (dx*dx));
    d = hypot(dx,dy); // Suggested by Keith Briggs
    
    /* Check for solvability. */
    if (d > (r0 + r1))
    {
        /* no solution. circles do not intersect. */
        return 0;
    }
    if (d < fabs(r0 - r1))
    {
        /* no solution. one circle is contained in the other */
        return 0;
    }
    
    /* 'point 2' is the point where the line through the circle
     * intersection points crosses the line between the circle
     * centers.
     */
    
    /* Determine the distance from point 0 to point 2. */
    a = ((r0*r0) - (r1*r1) + (d*d)) / (2.0 * d) ;
    
    /* Determine the coordinates of point 2. */
    x2 = x0 + (dx * a/d);
    y2 = y0 + (dy * a/d);
    
    /* Determine the distance from point 2 to either of the
     * intersection points.
     */
    h = sqrt((r0*r0) - (a*a));
    
    /* Now determine the offsets of the intersection points from
     * point 2.
     */
    rx = -dy * (h/d);
    ry = dx * (h/d);
    
    /* Determine the absolute intersection points. */
    *xi = x2 + rx;
    *xi_prime = x2 - rx;
    *yi = y2 + ry;
    *yi_prime = y2 - ry;
    
    return 1;
}


@implementation BSDIntersect2Circles
{
    BOOL kExtendedDebugging;
}

- (void)extendedDebugging:(BOOL)extendedDebug
{
    kExtendedDebugging = extendedDebug;
}

- (void)setupWithArguments:(id)arguments
{
    self.name = @"2 circle intersect";
    self.circle1 = self.hotInlet;
    self.circle2 = self.coldInlet;
    
    self.circle1Center = [[BSDOutlet alloc]init];
    self.circle1Center.name = @"circle 1 center";
    self.circle2Center = [[BSDOutlet alloc]init];
    self.circle2Center.name = @"circle 2 center";
    
    [self addPort:self.circle1Center];
    [self addPort:self.circle2Center];
}

- (void)calculateOutput
{
    NSDictionary *circle1 = self.circle1.value;
    NSDictionary *circle2 = self.circle2.value;
    
    if (circle1 && circle2) {
        
        NSValue *circle1CenterValue = circle1[@"center"];
        NSNumber *circle1Radius = circle1[@"radius"];
        CGPoint circle1Center = circle1CenterValue.CGPointValue;
        double x1 = circle1Center.x;
        double y1 = circle1Center.y;
        double r1 = circle1Radius.doubleValue;
        
        NSValue *circle2CenterValue = circle2[@"center"];
        NSNumber *circle2Radius = circle2[@"radius"];
        CGPoint circle2Center = circle2CenterValue.CGPointValue;
        
        double x2 = circle2Center.x;
        double y2 = circle2Center.y;
        double r2 = circle2Radius.doubleValue;
        
        double xi,yi,xj,yj;
        
        int result = circle_circle_intersection(x1, y1, r1, x2, y2, r2, &xi, &yi, &xj, &yj);
        NSString *debugText = nil;
        if (result) {
            CGPoint i = CGPointMake(xi, yi);
            CGPoint j = CGPointMake(xj, yj);
            self.circle1Center.value = [NSValue wrapPoint:i];
            self.circle2Center.value = [NSValue wrapPoint:j];
            
            self.mainOutlet.value = @{@"i": [NSValue wrapPoint:i],@"j":[NSValue wrapPoint:j]};
            
            debugText = [NSString stringWithFormat:@"\n\nINTERSECT CIRCLES\n\nREFERENCE CIRCLE 1\n\tcenter = (%.1f, %.1f)\n\tradius = %.1f\n\nREFERENCE CIRCLE 2\n\tcenter = (%.1f, %.1f)\n\tradius = %.1f\n\nRESULTS\n\tintersection i = (%.1f, %.1f)\n\tintersection j = (%.1f, %.1f)\n\n",x1,y1,r1,x2,y2,r2,xi,yi,xj,yj];
            
        }else{
            

            self.mainOutlet.value = NULL;
            
            debugText = [NSString stringWithFormat:@"\n\nINTERSECT CIRCLES\n\nREFERENCE CIRCLE 1\n\tcenter = (%.1f, %.1f)\n\tradius = %.1f\n\nREFERENCE CIRCLE 2\n\tcenter = (%.1f, %.1f)\n\tradius = %.1f\n\nRESULTS\n\nNO INTERSECTIONS WERE FOUND!!\nFUUUUUUU....\n\n",x1,y1,r1,x2,y2,r2];
        }
        
        if (kExtendedDebugging) {
            NSLog(@"%@",debugText);
        }
    }
    
}




@end
