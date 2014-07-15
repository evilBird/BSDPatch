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
//Ports get assigned the object id of the BSDObject instance to which they belong
@property (nonatomic,assign) NSString *objectId;




@end
