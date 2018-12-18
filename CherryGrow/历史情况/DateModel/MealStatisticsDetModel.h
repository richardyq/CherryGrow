//
//  MealStatisticsDetModel.h
//  CherryGrow
//
//  Created by YinQ on 2018/12/18.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import "StatisticsDetModel.h"

@interface MealStatisticsDetModel : StatisticsDetModel

@property (nonatomic, assign) NSInteger speedFast;
@property (nonatomic, assign) NSInteger speedNormal;
@property (nonatomic, assign) NSInteger speedSlow;

@property (nonatomic, assign) NSInteger feedGood;
@property (nonatomic, assign) NSInteger feedNormal;
@property (nonatomic, assign) NSInteger feedLow;

@property (nonatomic, assign) NSInteger amountMuch;
@property (nonatomic, assign) NSInteger amountNormal;
@property (nonatomic, assign) NSInteger amountFew;

@end
