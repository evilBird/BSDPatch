//
//  BSDDictionaryDripValues.m
//  DataFlowViews
//
//  Created by Travis Henspeter on 4/4/17.
//  Copyright © 2017 Travis Henspeter. All rights reserved.
//

#import "BSDDictionaryDripValues.h"

@implementation BSDDictionaryDripValues

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
  return [super initWithArguments:dictionary];
}

- (void)setupWithArguments:(id)arguments
{
  self.name = @"dictionary serialize";
  NSDictionary *dictionary = arguments;
  if (dictionary) {
    self.coldInlet.value = dictionary;
  }

  self.doneOutlet = [[BSDOutlet alloc]init];
  self.doneOutlet.name = @"done";
  [self addPort:self.doneOutlet];
}

- (void)calculateOutput{
  NSDictionary* hot = self.hotInlet.value;
  if (hot == nil || ![hot isKindOfClass:[NSDictionary class]]){
    return;
  }

  for (id value in hot.allValues) {
    self.mainOutlet.value = value;
  }

  self.doneOutlet.value = [BSDBang bang];

}

@end
