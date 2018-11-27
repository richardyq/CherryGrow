//
//  MealHistoryDetModel.h
//  CherryGrow
//
//  Created by YinQ on 2018/11/26.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import "SituationHistoryDetModel.h"

@interface MealHistoryDetModel : SituationHistoryDetModel

@property (nonatomic, assign) NSInteger code;
@property (nonatomic, assign) NSInteger speed;
@property (nonatomic, assign) NSInteger amount;
@property (nonatomic, assign) NSInteger feed;
@property (nonatomic, assign) CGFloat score;

@property (nonatomic, strong) NSString* codeName;
@property (nonatomic, strong) NSString* speedName;
@property (nonatomic, strong) NSString* amountName;
@property (nonatomic, strong) NSString* feedName;
@end
