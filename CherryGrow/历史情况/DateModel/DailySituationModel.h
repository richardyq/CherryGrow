//
//  DailySituationModel.h
//  CherryGrow
//
//  Created by YinQ on 2018/11/26.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MealHistoryDetModel.h"
#import "SleepHistoryDetModel.h"
#import "InterestHistoryDetModel.h"

@interface DailySituationModel : NSObject

@property (nonatomic, strong) NSString* date;

@property (nonatomic, strong) NSArray<MealHistoryDetModel*>* mealSituationModels;
@property (nonatomic, strong) NSArray<SleepHistoryDetModel*>* sleepSituationModels;
@property (nonatomic, strong) NSArray<InterestHistoryDetModel*>* interestSituationModels;

@end

@interface SituationHistoryRetModel : NSObject

@property (nonatomic, assign) NSInteger count;
@property (nonatomic, strong) NSArray<DailySituationModel*>* list;

@end
