//
//  SituationRequestManager.h
//  CherryGrow
//
//  Created by YinQ on 2018/11/19.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SituationRequestManager : NSObject

+ (void) createTodayMealSituationRequst:(CDRequestSuccess) successHandler
                                 failed:(CDRequestFailed) failedHandler
                               complete:(CDRequestComplete) completeHandler;

+ (void) createAddMealSituation:(NSInteger) mealCode
                          speed:(NSInteger) speed
                           feed:(NSInteger) feed
                         amount:(NSInteger) amount
                        success:(CDRequestSuccess) successHandler
                         failed:(CDRequestFailed) failedHandler
                       complete:(CDRequestComplete) completeHandler;

+ (void) createTodaySleepSituationRequst:(CDRequestSuccess) successHandler
                                  failed:(CDRequestFailed) failedHandler
                                complete:(CDRequestComplete) completeHandler;

+ (void) createAddSleepSituationRequest:(NSInteger) code
                                 status:(NSInteger) status
                                success:(CDRequestSuccess) successHandler
                                 failed:(CDRequestFailed) failedHandler
                               complete:(CDRequestComplete) completeHandler;

+ (void) createInterestCatesRequest:(CDRequestSuccess) successHandler
                             failed:(CDRequestFailed) failedHandler
                           complete:(CDRequestComplete) completeHandler;
@end
