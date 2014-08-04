//
//  BSDPort.h
//  BSDLang
//
//  Created by Travis Henspeter on 7/13/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BSDPortDelegate

- (void)portReceivedBang:(id)sender;

@end

@interface BSDPort : NSObject 

//Current value
@property (nonatomic)id value;
//Human readable name
@property (nonatomic,strong) NSString *name;
//Unique identifer for a specific port
@property (nonatomic,strong) NSString *portId;
//Ports get assigned the object id of the BSDObject instance to which they belong
@property (nonatomic,assign) NSString *objectId;
//Indicates whether the port is currently accepting input
@property (nonatomic,getter = isOpen) BOOL open;
//Keep references to observed ports
@property (nonatomic,strong) NSMutableSet *observedPorts;
//Port delegate 
@property (nonatomic,weak)id<BSDPortDelegate>delegate;

- (instancetype)init;
- (void)observePort:(BSDPort *)port;
- (void)stopObservingPort:(BSDPort *)port;
- (void)forwardToPort:(BSDPort *)port;
- (void)removeForwardPort:(BSDPort *)port;

@end
