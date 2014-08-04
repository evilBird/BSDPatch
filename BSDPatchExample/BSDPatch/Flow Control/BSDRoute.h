//
//  BSDRoute.h
//  BSDLang
//
//  Created by Travis Henspeter on 7/13/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDObject.h"

@interface BSDRoute : BSDObject

//Inlets
//Hot: takes a dictionary with containing key-value pairs, routes the values to the outlets specified by the key
//Cold: NA

//Outlets
//Main outlet: passes through the input
//Additional outlets: Has as many outlets as there are keys specified by the creation arguments

- (instancetype)initWithRouteKeys:(NSArray *)routeKeys;
//convenience intitializer which creates outlets for each specified inlet/outlet pair
- (instancetype)initAndConnectWithRouteKeysAndInlets:(NSDictionary *)routeKeysAndInlets;
//Get a specific outlet by route key
- (BSDOutlet *)outletForRouteKey:(NSString *)aRouteKey;

//Add an outlet for a route key
- (BSDOutlet *)addOutletForRouteKey:(NSString *)routeKey;
- (BSDOutlet *)addOutletForRouteKey:(NSString *)routeKey connectToInlet:(BSDInlet *)inlet;

@end
