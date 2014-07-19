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

}

- (void)calculateOutput
{
    id hot = self.hotInlet.value;
    

}
/*
+ (NSDictionary *)propertyListForObject:(id)obj
{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    
    unsigned count;
    objc_property_t *properties = class_copyPropertyList([obj class], &count);
    
    for (int i = 0; i < count; i++) {
        NSString *key = [NSString stringWithUTF8String:property_getName(properties[i])];
        Class classObject = NSClassFromString([key capitalizedString]);
        
        id object = [obj valueForKey:key];
        
        if (classObject) {
            id subObj = [BSDStyleSheetUtility propertyListForObject:object];
            [dict setObject:subObj forKey:key];
        }
        else if([object isKindOfClass:[NSArray class]])
        {
            NSMutableArray *subObj = [NSMutableArray array];
            for (id o in object) {
                [subObj addObject:[BSDStyleSheetUtility propertyListForObject:o] ];
            }
            [dict setObject:subObj forKey:key];
        }
        else
        {
            if(object) [dict setObject:object forKey:key];
        }
    }
    
    free(properties);
    return [NSDictionary dictionaryWithDictionary:dict];
}
 */

+ (NSArray *)stackForObject:(id)object
{
    NSMutableArray *stacks = [NSMutableArray array];
    
    for (NSString *sourceString in [NSThread callStackSymbols]) {
        NSCharacterSet *separatorSet = [NSCharacterSet characterSetWithCharactersInString:@" -[]+?.,"];
        NSMutableArray *array = [NSMutableArray arrayWithArray:[sourceString  componentsSeparatedByCharactersInSet:separatorSet]];
        [array removeObject:@""];
        if (array.count >= 5) {
            NSDictionary *componentDictionary = @{@"stack": array[0],
                                                  @"id": array[2],
                                                  @"class":array[3],
                                                  @"method":array[4]
                                                  };
            [stacks addObject:componentDictionary];
            
        }
        
    }
    
    return stacks;
}

@end
