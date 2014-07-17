//
//  TestPatch.m
//  BSDLang
//
//  Created by Travis Henspeter on 7/13/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDDistance2D.h"
#import "BSDCreate.h"

@implementation BSDDistance2D


- (void)setupWithArguments:(id)arguments
{
    //setup arguments are an array of strings used to route values sent to the hot inlet: @[@"x0",@"y0",@"xf",@"yf"]
    //The first two arguments route x and y values, respectively, for a reference coordinate (x0,y0)
    //The last two arguments route x and y values, respectively, for a second coordinate (xf,yf)
    //The output is distance between these coordinates. Both coordinates may be dynamic.
    self.name = @"distance";
    self.processingChain = [NSMutableArray array];
    
    NSArray *args = (NSArray *)arguments;
    if (args.count < 4) {
        NSLog(@"BSDDistance setup failed - expected 4 arguments, got %lu",(unsigned long)args.count);
    }else{
        
        BSDRoute *route = [[BSDRoute alloc]initWithArguments:args];
        [self.processingChain addObject:route];
        BSDSubtract *diffX = [BSDCreate subtract];
        diffX.coldInlet.value = @(0);
        [self.processingChain addObject:diffX];
        BSDSubtract *diffY = [BSDCreate subtract];
        [self.processingChain addObject:diffY];
        diffY.coldInlet.value = @(0);
        
        [route connectOutletNamed:args[0]
                         toObject:diffX
                       inletNamed:@"cold"];
        
        [route connectOutletNamed:args[1]
                         toObject:diffX
                       inletNamed:@"hot"];
        
        [route connectOutletNamed:args[2]
                         toObject:diffY
                       inletNamed:@"cold"];
        
        [route connectOutletNamed:args[3]
                         toObject:diffY
                       inletNamed:@"hot"];
        
        BSDPower *squareX = [BSDCreate power];
        [self.processingChain addObject:squareX];
        squareX.coldInlet.value = @(2);
        [diffX connect:squareX.hotInlet];
        BSDPower *squareY = [BSDCreate power];
        [self.processingChain addObject:squareY];
        squareY.coldInlet.value = @(2);
        [diffY connect:squareY.hotInlet];
        BSDAdd *addSquares = [BSDCreate add];
        [self.processingChain addObject:addSquares];
        [squareY connect:addSquares.coldInlet];
        [squareX connect:addSquares.hotInlet];
        BSDPower *rootSum = [BSDCreate power];
        [self.processingChain addObject:rootSum];
        rootSum.coldInlet.value = @(0.5);
        [addSquares connect:rootSum.hotInlet];
    }

    
}

- (void)calculateOutput
{
    [(BSDObject *)self.processingChain.firstObject hotInlet].value = self.hotInlet.value;
    self.mainOutlet.value = [(BSDObject *)self.processingChain.lastObject mainOutlet].value;;
}

@end
