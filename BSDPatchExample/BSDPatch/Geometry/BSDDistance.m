//
//  TestPatch.m
//  BSDLang
//
//  Created by Travis Henspeter on 7/13/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDDistance.h"
#import "BSDCreate.h"

@implementation BSDDistance

- (void)setupWithArguments:(id)arguments
{
    self.processingChain = [NSMutableArray array];
    NSArray *args = (NSArray *)arguments;
    if (args.count < 4) {
        NSLog(@"BSDDistance setup failed - expected 4 arguments, got %lu",(unsigned long)args.count);
    }else{
        
        BSDRoute *route = [[BSDRoute alloc]initWithArguments:args];
        [self.processingChain addObject:route];
        BSDSubtract *diffX = [BSDCreate subtract];
        [diffX cold:@(0)];
        [self.processingChain addObject:diffX];
        BSDSubtract *diffY = [BSDCreate subtract];
        [self.processingChain addObject:diffY];
        [diffY cold:@(0)];
        
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
        [squareX setColdInletValue:@(2)];
        [diffX connect:squareX];
        BSDPower *squareY = [BSDCreate power];
        [self.processingChain addObject:squareY];
        [squareY setColdInletValue:@(2)];
        [diffY connect:squareY];
        BSDAdd *addSquares = [BSDCreate add];
        [self.processingChain addObject:addSquares];
        [squareY connectToCold:addSquares];
        [squareX connectToHot:addSquares];
        BSDPower *rootSum = [BSDCreate power];
        [self.processingChain addObject:rootSum];
        [rootSum setColdInletValue:@(0.5)];
        [addSquares connectToHot:rootSum];
    }

    
}

- (id)calculateOutputValue
{
    [(BSDObject *)self.processingChain.firstObject setHotInletValue:[self hotInletValue]];
    return [(BSDObject *)self.processingChain.lastObject mainOutlet].value;
}

@end
