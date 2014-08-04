//
//  BSDMapObject.m
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/18/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDMapObject.h"
#import <objc/runtime.h>

@implementation BSDMapObject

- (void)setupWithArguments:(id)arguments
{
    self.name = @"mapObject";
    self.coldInlet.open = NO;
}

- (void)calculateOutput
{
    id hot = self.hotInlet.value;
    self.mainOutlet.value = plist_for_object(hot);
}

NSDictionary* plist_for_object(id obj)
{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    
    unsigned count;
    objc_property_t *properties = class_copyPropertyList([obj class], &count);
    
    for (int i = 0; i < count; i++) {
        NSString *key = [NSString stringWithUTF8String:property_getName(properties[i])];
        Class classObject = NSClassFromString([key capitalizedString]);
        
        id object = [obj valueForKey:key];
        
        if (classObject) {
            id subObj = plist_for_object(object);
            [dict setObject:subObj forKey:key];
        }
        else if([object isKindOfClass:[NSArray class]])
        {
            NSMutableArray *subObj = [NSMutableArray array];
            for (id o in object) {
                [subObj addObject:plist_for_object(o) ];
            }
            [dict setObject:subObj forKey:key];
        }
        else
        {
            if(object) [dict setObject:[NSString stringWithFormat:@"%p",object] forKey:key];
        }
    }
    
    free(properties);
    return [NSDictionary dictionaryWithDictionary:dict];
}


@end
