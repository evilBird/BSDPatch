//
//  BSDRoute.m
//  BSDLang
//
//  Created by Travis Henspeter on 7/13/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDRoute.h"

@implementation BSDRoute

- (instancetype)initWithRouteKeys:(NSArray *)routeKeys
{
    return [super initWithArguments:routeKeys];
}

- (instancetype)initAndConnectWithRouteKeysAndInlets:(NSDictionary *)routeKeysAndInlets
{
    return [super initWithArguments:routeKeysAndInlets];
}

- (void)setupWithArguments:(id)arguments
{
    self.name = @"route";
    self.coldInlet.open = NO;
    if ([arguments isKindOfClass:[NSArray class]]) {
        NSArray *routeKeys = arguments;
        for (NSString *aRouteKey in routeKeys) {
            
            [self addOutletForRouteKey:aRouteKey];
        }
    }else if ([arguments isKindOfClass:[NSDictionary class]]){
        NSDictionary *routeKeysAndInlets = arguments;
        for (NSString *aRouteKey in routeKeysAndInlets.allKeys) {
            BSDInlet *anInlet = routeKeysAndInlets[aRouteKey];
            [self addOutletForRouteKey:aRouteKey connectToInlet:anInlet];
        }
    }
}

- (void)calculateOutput
{
  NSDictionary *hot = self.hotInlet.value;
  NSMutableDictionary* hotCopy = hot.mutableCopy;
  [hot enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
    BSDOutlet* anOutlet = [self outletForRouteKey:key];
    if (anOutlet != nil){
      [hotCopy removeObjectForKey:key];
      anOutlet.value = obj;
    }
  }];

  self.mainOutlet.value = hotCopy;
}

- (BSDOutlet *)addOutletForRouteKey:(NSString *)routeKey
{
    BSDOutlet *outlet = [[BSDOutlet alloc]init];
    outlet.name = routeKey;
    [self addPort:outlet];
    return outlet;
}

- (BSDOutlet *)addOutletForRouteKey:(NSString *)routeKey connectToInlet:(BSDInlet *)inlet
{
    BSDOutlet *outlet = [self addOutletForRouteKey:routeKey];
    [outlet connectToInlet:inlet];
    return outlet;
}

- (BSDOutlet *)outletForRouteKey:(NSString *)aRouteKey
{
    return [self outletNamed:aRouteKey];
}

@end
