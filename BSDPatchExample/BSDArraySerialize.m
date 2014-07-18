//
//  BSDArraySerialize.m
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/18/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDArraySerialize.h"
#import "BSDCreate.h"

@interface BSDArraySerialize ()

@property (nonatomic,strong)BSDCounter *counter;
@property (nonatomic,strong)BSDClipFilter *filterIndex;
@property (nonatomic,strong)BSDValueBox *valueBox;
@property (nonatomic,strong)NSNumber *incrementValue;
@property (nonatomic,strong)NSNumber *firstcounterValue;

@end

@implementation BSDArraySerialize

- (void)setupWithArguments:(id)arguments
{
    self.name = @"serialize";
    self.filterIndex = nil;
    self.arrayInlet = self.coldInlet;
    self.arrayInlet.name = @"array";
    self.arrayInlet.hot = YES;
    [self handleInputArguments:arguments];
    
    self.counter = [BSDCreate counterCold:self.firstcounterValue stepSize:self.incrementValue];
    [self.hotInlet forwardToPort:self.counter.hotInlet];
    [self.counter connect:self.filterIndex.hotInlet];
    
    if (_wraps) {
        self.valueBox = [BSDCreate valueBoxCold:self.firstcounterValue];
        [self.filterIndex connectOutlet:self.filterIndex.outOfRangeOutlet toInlet:self.valueBox.hotInlet];
        [self.valueBox connect:self.counter.coldInlet];
    }
    
    __weak BSDArraySerialize *WEAK_SELF = self;
    self.filterIndex.outputBlock = ^(BSDObject *object, BSDOutlet *outlet){
        id array = WEAK_SELF.coldInlet.value;
        id index = WEAK_SELF.filterIndex.mainOutlet.value;
        if (array!=NULL && index!=NULL) {
            WEAK_SELF.mainOutlet.value = array[[index integerValue]];
        }
    };
    
}

- (void)handleInputArguments:(NSArray *)arguments
{
    NSArray *args = (NSArray *)arguments;
    if (args && [args isKindOfClass:[NSArray class]]) {
        if (args.count > 0) {
            NSArray *toSerialize = args[0];
            if (toSerialize && [toSerialize isKindOfClass:[NSArray class]]) {
                [self.coldInlet input:toSerialize];
                self.filterIndex = [BSDCreate clipFilterMin:@(0) Max:@(toSerialize.count - 1)];
                self.firstcounterValue = @(toSerialize.count);
            }else{
                self.filterIndex = [BSDCreate clipFilter];
            }
        }
        
        if (args.count > 1) {
            _reverse = [args[1] boolValue];
        }else{
            _reverse = NO;
        }
        
        if (args.count > 2) {
            _wraps = [args[2] boolValue];
        }else{
            _wraps = NO;
        }
        
    }else{
        
        self.filterIndex = [BSDCreate clipFilter];
        _wraps = NO;
        _reverse = NO;
        self.firstcounterValue = @(-1);
    }
    
    if (_reverse) {
        self.incrementValue = @(-1);
    }else{
        self.incrementValue = @(1);
    }
    
}

- (void) hotInlet:(BSDInlet *)inlet receivedValue:(id)value
{
    //override to get access to the hot inlet that changed
    if ([inlet isEqual:self.arrayInlet]) {
        NSArray *array = inlet.value;
        [self.filterIndex.minInlet input:@(0)];
        [self.filterIndex.maxInlet input:@(array.count - 1)];
    }
}


@end
