//
//  InterestSituation.h
//  CherryGrow
//
//  Created by YinQ on 2018/11/26.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import "SituationModel.h"
#import "InterestCateModel.h"

@interface InterestDetSituation : SituationDetModel

@property (nonatomic, assign) NSInteger cateId;
@property (nonatomic, assign) NSInteger status;
@property (nonatomic, assign) NSInteger score;
@property (nonatomic, strong) InterestCateModel* cate;


@end

@interface InterestSituation : SituationModel

@property (nonatomic, assign) NSInteger cateId;
@property (nonatomic, assign) NSInteger status;
@property (nonatomic, assign) NSInteger score;

@property (nonatomic, readonly) NSString* cateName;
@property (nonatomic, readonly) NSString* statusName;

@property (nonatomic, strong) InterestDetSituation* det;
@end
