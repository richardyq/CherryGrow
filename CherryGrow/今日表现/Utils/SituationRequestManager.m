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
    MealSituation* situation = [MealSituation new];
    situation.date = [[NSDate date] stringWithFormat:@"yyyy-MM-dd"];
    situation.mealCode = mealCode;
    situation.speed = speed;
    situation.feed = feed;
    situation.amount = amount;
    CDJsonRequest* request = [[AddMealSituationRequest alloc] initWithMealSituation:situation];
    [[CDRequestManager shareInstance] createRequest:request observice:observice];
}
@end
