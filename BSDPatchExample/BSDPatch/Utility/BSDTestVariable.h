//
//  BSDVariable.h
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/16/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BSDTestVariable : NSObject

@property (nonatomic,strong)NSNumber *var1;
@property (nonatomic,strong)NSNumber *var2;
@property (nonatomic,strong)NSNumber *var3;

-(id)initVar1:(NSNumber *)var1 var2:(NSNumber *)var2 var3:(NSNumber *)var3;

@end
