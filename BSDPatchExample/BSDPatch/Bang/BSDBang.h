//
//  BSDBang.h
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/17/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BSDBang : NSObject

//BSDBang: a generic event

+ (BSDBang *)bang;

@property (nonatomic,readonly)NSDate *timeStamp;
- (NSString *)uniqueId;

@end
