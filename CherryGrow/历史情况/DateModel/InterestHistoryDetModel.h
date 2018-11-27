//
//  InterestHistoryDetModel.h
//  CherryGrow
//
//  Created by YinQ on 2018/11/26.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import "SituationHistoryDetModel.h"

@interface InterestHistoryDetModel : SituationHistoryDetModel

@property (nonatomic, assign) NSInteger cateId;
@property (nonatomic, strong) NSString* cateName;
@property (nonatomic, assign) NSInteger score;
@property (nonatomic, assign) NSInteger status;
@property (nonatomic, strong) NSString* statusName;

@end
