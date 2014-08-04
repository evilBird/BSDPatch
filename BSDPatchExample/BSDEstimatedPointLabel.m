//
//  BSDEstimatedPointLabel.m
//  BSDPatchExample
//
//  Created by Travis Henspeter on 7/20/14.
//  Copyright (c) 2014 birdSound LLC. All rights reserved.
//

#import "BSDEstimatedPointLabel.h"

@implementation BSDEstimatedPointLabel

- (instancetype)initWithUILabel:(UILabel *)label pointName:(NSString *)pointName
{
    return [super initWithArguments:@{@"label": label, @"name":pointName}];
}

- (void)setupWithArguments:(id)arguments
{
    NSDictionary *args = (NSDictionary *)arguments;
    if (args) {
        UILabel *label = args[@"label"];
        [super setupWithArguments:label];
        self.pointName = args[@"name"];
    }
    
    self.name = @"estimated point label";
    
    self.estimatedPointInlet = [[BSDInlet alloc]initHot];
    self.estimatedPointInlet.name = @"estimated point inlet";
    [self addPort:self.estimatedPointInlet];
    
    self.splitPoint = [[BSDSplitPoint alloc]init];
    [self.estimatedPointInlet forwardToPort:self.splitPoint.hotInlet];
    self.intX = [[BSDInt alloc]init];
    [self.splitPoint connectOutlet:self.splitPoint.x toInlet:self.intX.hotInlet];
    self.intY = [[BSDInt alloc]init];
    [self.splitPoint connectOutlet:self.splitPoint.y toInlet:self.intY.hotInlet];
    self.makeArray = [[BSDArrayPack alloc]initWithArguments:@[self.pointName,self.intX.mainOutlet,self.intY.mainOutlet]];
    NSString *format = @"estimated point %@:\n(%@,%@)";
    self.formatString = [[BSDFormatString alloc]initWithFormatString:format];
    [self.makeArray connect:self.formatString.hotInlet];
    self.prependTextKey = [BSDCreate prependKeyCold:@"text"];
    [self.formatString connect:self.prependTextKey.hotInlet];
    [self.prependTextKey connect:self.hotInlet];
    
    
    self.offsetCenter = [BSDCreate add];
    self.offsetCenter.coldInlet.value = @(-50);
    [self.intY connect:self.offsetCenter.hotInlet];
    self.makeCenter = [BSDCreate point];
    [self.offsetCenter connect:self.makeCenter.yInlet];
    [self.intX connect:self.makeCenter.xInlet];
    self.prependCenterKey = [BSDCreate prependKeyCold:@"center"];
    [self.makeCenter connect:self.prependCenterKey.hotInlet];
    [self.prependCenterKey connect:self.hotInlet];
    
}

+ (UILabel *)newLabelWithFrame:(CGRect)frame textColor:(UIColor *)color
{
    UILabel *label = [[UILabel alloc]initWithFrame:frame];
    label.textAlignment = NSTextAlignmentCenter;
    label.numberOfLines = 2;
    label.textColor = color;
    return label;
}

@end
