//
//  InterestStatisticsDetModel.h
//  CherryGrow
//
//  Created by YinQ on 2018/12/19.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import "StatisticsDetModel.h"

@interface InterestStatisticsItemModel : NSObject
@property (nonatomic, strong) NSString* cateName;
@property (nonatomic, assign) NSInteger goodCount;
@property (nonatomic, assign) NSInteger normalCount;
@property (nonatomic, assign) NSInteger lowCount;

@end

@interface InterestStatisticsDetModel : StatisticsDetModel

@property (nonatomic, strong) NSArray<InterestStatisticsItemModel*>* detModels;

@end
