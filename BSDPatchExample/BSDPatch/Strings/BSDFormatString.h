//
//  BSDFormatString.h
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/20/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDObject.h"

@interface BSDFormatString : BSDObject

//BSDFormatString: format arguments as a string
//Hot inlet: takes an array of arguments
//Cold inlet: takes a format string, e.g. @"argument 1 is %@, argument 2 is %@"
//Main outlet: emits the formatted string when args are received by hot inlet

- (instancetype)initWithFormatString:(NSString *)formatString;

@end
