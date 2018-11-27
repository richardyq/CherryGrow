//
//  SleepHistoryDetModel.h
//  CherryGrow
//
//  Created by YinQ on 2018/11/26.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import "SituationHistoryDetModel.h"

@interface SleepHistoryDetModel : SituationHistoryDetModel

@property (nonatomic, assign) NSInteger code;
@property (nonatomic, assign) NSInteger status;
@property (nonatomic, assign) NSInteger score;

@property (nonatomic, strong) NSString* codeName;
@property (nonatomic, strong) NSString* statusName;

@end
