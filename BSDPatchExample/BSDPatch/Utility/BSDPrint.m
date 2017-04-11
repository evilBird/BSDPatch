//
//  BSDPrint.m
//  DataFlowViews
//
//  Created by Travis Henspeter on 4/4/17.
//  Copyright © 2017 Travis Henspeter. All rights reserved.
//

#import "BSDPrint.h"

@implementation BSDPrint

- (void)setupWithArguments:(id)arguments{
  self.name = arguments;
  self.coldInlet.value = arguments;
}

- (void)calculateOutput{
  id hot = self.hotInlet.value;
  id name = self.coldInlet.value;
  if (hot != nil){
    NSString* toPrint = [NSString stringWithFormat:@"[%f] %@: %@",[NSDate timeIntervalSinceReferenceDate], name, hot];
    NSLog(@"%@",toPrint);
  }
}

@end
