//
//  BSDPort.h
//  BSDLang
//
//  Created by Travis Henspeter on 7/13/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BSDPort : NSObject

@property (nonatomic)id value;
@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSNumber *patchId;

- (id)initWithValue:(id)value;
- (id)initWithValue:(id)value name:(NSString *)name;
- (id)initWithValue:(id)value name:(NSString *)name patchId:(NSNumber *)patchId;


@end
