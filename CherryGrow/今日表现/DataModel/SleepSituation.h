//
//  SleepSituation.h
//  CherryGrow
//
//  Created by YinQ on 2018/11/20.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserModel.h"
#import "SituationModel.h"

@interface SleepDetSituation : SituationDetModel

@property (nonatomic, assign) NSInteger code;
@property (nonatomic, assign) NSInteger status;
@property (nonatomic, assign) NSInteger score;

@end

@interface SleepSituation : SituationModel

@property (nonatomic, assign) NSInteger code;
@property (nonatomic, assign) NSInteger status;
@property (nonatomic, assign) NSInteger score;


@property (nonatomic, strong) SleepDetSituation* det;

@end

@interface SleepSituationParam : NSObject

@property (nonatomic, strong) NSString* date;
@property (nonatomic, assign) NSInteger code;
@property (nonatomic, assign) NSInteger status;

@property (nonatomic, strong) NSString* userId;

@end
