//
//  TestPatch.m
//  BSDLang
//
//  Created by Travis Henspeter on 7/13/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDDistance2D.h"
#import "BSDCreate.h"

@interface BSDDistance2D ()


@property (nonatomic,strong)BSDRoute *route;
@property (nonatomic,strong)BSDSubtract *diffX;
@property (nonatomic,strong)BSDSubtract *diffY;
@property (nonatomic,strong)BSDExponent *squareX;
@property (nonatomic,strong)BSDExponent *squareY;
@property (nonatomic,strong)BSDAdd *addSquares;
@property (nonatomic,strong)BSDExponent *rootSum;

@end

@implementation BSDDistance2D

- (void)setupWithArguments:(id)arguments
{
    //setup arguments are an array of strings used to route values sent to the hot inlet: @[@"x0",@"y0",@"xf",@"yf"]
    //The first two arguments route x and y values, respectively, for a reference coordinate (x0,y0)
    //The last two arguments route x and y values, respectively, for a second coordinate (xf,yf)
    //The output is distance between these coordinates. Both coordinates may be dynamic.
    self.name = @"distance";
    
    NSArray *routingSelectors = @[@"x0",@"y0",@"xf",@"yf"];
    
    self.route = [BSDCreate routeKeys:routingSelectors];
    [self.hotInlet forwardToPort:self.route.hotInlet];
    self.diffX = [BSDCreate subtractCold:@(0)];
    self.diffY = [BSDCreate subtractCold:@(0)];
    self.squareX = [BSDCreate powerCold:@(2)];
    self.squareY = [BSDCreate powerCold:@(2)];
    self.addSquares = [BSDCreate add];
    self.rootSum = [BSDCreate powerCold:@(0.5)];
    
    [[self.route outletNamed:routingSelectors[0]]connectToInlet:self.diffX.coldInlet];
    [[self.route outletNamed:routingSelectors[1]]connectToInlet:self.diffY.coldInlet];
    [[self.route outletNamed:routingSelectors[2]]connectToInlet:self.diffX.hotInlet];
    [[self.route outletNamed:routingSelectors[3]]connectToInlet:self.diffY.hotInlet];

    [self.diffX connect:self.squareX.hotInlet];
    [self.diffY connect:self.squareY.hotInlet];
    [self.squareY connect:self.addSquares.coldInlet];
    [self.squareX connect:self.addSquares.hotInlet];
    [self.addSquares connect:self.rootSum.hotInlet];
    [self.rootSum.mainOutlet forwardToPort:self.mainOutlet];
    
}

- (void)calculateOutput
{
    
}


@end
