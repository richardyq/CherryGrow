//
//  MealSituation.h
//  CherryGrow
//
//  Created by YinQ on 2018/11/19.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserModel.h"
@interface MealSituation : NSObject

@property (nonatomic, strong) NSString* mealId;
@property (nonatomic, strong) NSString* date;
@property (nonatomic, assign) NSInteger mealCode;
@property (nonatomic, assign) NSInteger speed;
@property (nonatomic, assign) NSInteger amount;
@property (nonatomic, assign) NSInteger feed;
@property (nonatomic, assign) CGFloat score;

@property (nonatomic, strong) UserModel* user;
@property (nonatomic, strong) NSString* updateTime;

@end

@interface MealSituationParam : NSObject

@property (nonatomic, strong) NSString* date;
@property (nonatomic, assign) NSInteger mealCode;
@property (nonatomic, assign) NSInteger speed;
@property (nonatomic, assign) NSInteger amount;
@property (nonatomic, assign) NSInteger feed;

@property (nonatomic, strong) NSString* userId;

@end
