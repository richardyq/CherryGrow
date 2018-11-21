//
//  SituationRequestManager.m
//  CherryGrow
//
//  Created by YinQ on 2018/11/19.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import "SituationRequestManager.h"
#import "TodayMealSituationListRequest.h"
#import "AddMealSituationRequest.h"
#import "TodaySleepSituationListRequest.h"
#import "AddSleepSituationRequest.h"

@implementation SituationRequestManager

+ (void) createTodayMealSituationRequst:(CDRequestSuccess) successHandler
                                 failed:(CDRequestFailed) failedHandler
                               complete:(CDRequestComplete) completeHandler{
    CDRequestObservice* observice = [[CDRequestObservice alloc] initWithSuccess:successHandler failed:failedHandler complete:completeHandler];
    CDJsonRequest* request = [[TodayMealSituationListRequest alloc] init];
    [[CDRequestManager shareInstance] createRequest:request observice:observice];
}

+ (void) createAddMealSituation:(NSInteger) mealCode
                          speed:(NSInteger) speed
                           feed:(NSInteger) feed
                         amount:(NSInteger) amount
                        success:(CDRequestSuccess) successHandler
                         failed:(CDRequestFailed) failedHandler
                       complete:(CDRequestComplete) completeHandler{
    CDRequestObservice* observice = [[CDRequestObservice alloc] initWithSuccess:successHandler failed:failedHandler complete:completeHandler];
    MealSituationParam* situation = [MealSituationParam new];
    situation.date = [[NSDate date] stringWithFormat:@"yyyy-MM-dd"];
    situation.mealCode = mealCode;
    situation.speed = speed;
    situation.feed = feed;
    situation.amount = amount;
    situation.userId = [UserDefaults shareInstance].loginedUserId;
    CDJsonRequest* request = [[AddMealSituationRequest alloc] initWithMealSituation:situation];
    [[CDRequestManager shareInstance] createRequest:request observice:observice];
}

+ (void) createTodaySleepSituationRequst:(CDRequestSuccess) successHandler
                                 failed:(CDRequestFailed) failedHandler
                               complete:(CDRequestComplete) completeHandler{
    CDRequestObservice* observice = [[CDRequestObservice alloc] initWithSuccess:successHandler failed:failedHandler complete:completeHandler];
    CDJsonRequest* request = [[TodaySleepSituationListRequest alloc] init];
    [[CDRequestManager shareInstance] createRequest:request observice:observice];
}

+ (void) createAddSleepSituationRequest:(NSInteger) code
                                 status:(NSInteger) status
                                success:(CDRequestSuccess) successHandler
                                 failed:(CDRequestFailed) failedHandler
                               complete:(CDRequestComplete) completeHandler{
    CDRequestObservice* observice = [[CDRequestObservice alloc] initWithSuccess:successHandler failed:failedHandler complete:completeHandler];
    SleepSituationParam* situation = [SleepSituationParam new];
    situation.date = [[NSDate date] stringWithFormat:@"yyyy-MM-dd"];
    situation.code = code;
    situation.status = status;
    situation.userId = [UserDefaults shareInstance].loginedUserId;
    
    CDJsonRequest* request = [[AddSleepSituationRequest alloc] initWithSleepSituation:situation];
    [[CDRequestManager shareInstance] createRequest:request observice:observice];
}
@end
