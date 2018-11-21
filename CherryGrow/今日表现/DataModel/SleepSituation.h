//
//  SleepSituation.h
//  CherryGrow
//
//  Created by YinQ on 2018/11/20.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserModel.h"

@interface SleepSituation : NSObject

@property (nonatomic, strong) NSString* id;
@property (nonatomic, strong) NSString* date;
@property (nonatomic, assign) NSInteger code;
@property (nonatomic, assign) NSInteger status;
@property (nonatomic, assign) NSInteger score;

@property (nonatomic, strong) UserModel* user;
@property (nonatomic, strong) NSString* updateTime;


@end

@interface SleepSituationParam : NSObject

@property (nonatomic, strong) NSString* date;
@property (nonatomic, assign) NSInteger code;
@property (nonatomic, assign) NSInteger status;

@property (nonatomic, strong) NSString* userId;

@end
