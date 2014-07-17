//
//  BSDClassify.m
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/15/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDClassify.h"
#import "BSDCreate.h"

@implementation BSDClassify

- (void)setupWithArguments:(id)arguments
{
    self.name = @"classify";
    NSDictionary *args = (NSDictionary *)arguments;
    if (args) {
        self.hotInlet.value = args[@"to_classify"];
        self.coldInlet.value = args[@"predicates"];
    }
}

- (NSDictionary *)classifyGroups:(NSDictionary *)groups predicates:(NSArray *)predicates;
{
    NSString *firstKey = groups.allKeys.firstObject;
    if (firstKey.length == predicates.count) {
        return groups;
    }
    
    NSMutableDictionary *newGroups = [NSMutableDictionary dictionary];
    
    for (NSString *groupKey in groups.allKeys) {
        NSArray *group = groups[groupKey];
        NSUInteger idx = groupKey.length;
        NSPredicate *predicate = predicates[idx];
        NSArray *filtered = [group filteredArrayUsingPredicate:predicate];
        NSMutableSet *allGroups = [NSMutableSet setWithArray:group];
        NSSet *includedGroup = [NSSet setWithArray:filtered];
        [allGroups minusSet:includedGroup];
        NSSet *excludedGroup = [NSSet setWithSet:allGroups];
        if (includedGroup.allObjects.count > 0) {
            NSString *group1Key = [groupKey stringByAppendingString:@"1"];
            newGroups[group1Key] = includedGroup.allObjects;
        }
        if (excludedGroup.allObjects.count > 0) {
            NSString *group0Key = [groupKey stringByAppendingString:@"0"];
            newGroups[group0Key] = excludedGroup.allObjects;
        }
    }
    
    return [self classifyGroups:newGroups predicates:predicates];
}

- (id)calculateOutputValue
{
    id hot = self.hotInlet.value;
    id cold = self.coldInlet.value;
    if (cold == NULL) {
        return hot;
    }
    
    if (hot != NULL) {
        NSDictionary *all = @{@"":hot};
        return [self classifyGroups:all predicates:cold];
    }
    
    return nil;
}

#pragma mark - test

/*
- (void)test
{
    NSArray *testArray = [self testArrayWithLength:10000];
    NSPredicate *predicate1 = [NSPredicate predicateWithFormat:@"var1 > 50"];
    NSPredicate *predicate2 = [NSPredicate predicateWithFormat:@"var2 > 50"];
    NSPredicate *predicate3 = [NSPredicate predicateWithFormat:@"var3 > 50"];
    
    self.classify = [BSDCreate classify:@{@"to_classify": [NSNull null],
                                          @"predicates":@[predicate1,predicate2,predicate3]}];
    self.classify.outputUser = self;
    [self.classify hot:testArray];
}


- (NSArray *)testArrayWithLength:(NSUInteger)length
{
    NSMutableArray *result = [NSMutableArray arrayWithCapacity:length];
    for (NSInteger i = 0; i<length; i++) {
        NSNumber *random1 = @(arc4random_uniform(100));
        NSNumber *random2 = @(arc4random_uniform(100));
        NSNumber *random3 = @(arc4random_uniform(100));
        BSDTestVariable *variable = [[BSDTestVariable alloc]initVar1:random1
                                                                var2:random2
                                                                var3:random3];
        [result addObject:variable];
    }
    
    return result;
}
 
 */

@end
