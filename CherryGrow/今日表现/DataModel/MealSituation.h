//
//  MealSituation.h
//  CherryGrow
//
//  Created by YinQ on 2018/11/19.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserModel.h"
#import "SituationDetModel.h"
#import "SituationModel.h"

@interface MealDetSituationModel : SituationDetModel

@property (nonatomic, assign) NSInteger code;
@property (nonatomic, assign) NSInteger speed;
@property (nonatomic, assign) NSInteger amount;
@property (nonatomic, assign) NSInteger feed;
@property (nonatomic, assign) CGFloat score;

@end

@interface MealSituationParam : NSObject

@property (nonatomic, strong) NSString* date;
@property (nonatomic, assign) NSInteger code;
@property (nonatomic, assign) NSInteger speed;
@property (nonatomic, assign) NSInteger amount;
@property (nonatomic, assign) NSInteger feed;

@property (nonatomic, strong) NSString* userId;


@end

@interface MealSituation : SituationModel

@property (nonatomic, assign) NSInteger code;
@property (nonatomic, assign) NSInteger speed;
@property (nonatomic, assign) NSInteger amount;
@property (nonatomic, assign) NSInteger feed;
@property (nonatomic, assign) CGFloat score;

@property (nonatomic, strong) MealDetSituationModel* det;

@end
