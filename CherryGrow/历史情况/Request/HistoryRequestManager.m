//
//  HistoryRequestManager.m
//  CherryGrow
//
//  Created by YinQ on 2018/11/27.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import "HistoryRequestManager.h"
#import "HistoryRecordsRequest.h"
#import "DailySituationModel.h"
#import "TotalStatisticsRequest.h"

@implementation HistoryRequestManager

+ (void) createHistoryRecordRequest:(NSInteger) type
                           startRow:(NSInteger) startRow
                               rows:(NSInteger) rows
                          startDate:(NSString*) startDate
                            endDate:(NSString*) endDate
                            success:(CDRequestSuccess) successHandler
                             failed:(CDRequestFailed) failedHandler
                           complete:(CDRequestComplete) completeHandler{
    CDRequestObservice* observice = [[CDRequestObservice alloc] initWithSuccess:successHandler failed:failedHandler complete:completeHandler];
    
    CDJsonRequest* request = [[HistoryRecordsRequest alloc] initWithType:type startRow:startRow rows:rows startDate:startDate endDate:endDate];
    [[CDRequestManager shareInstance] createRequest:request observice:observice];
}

+ (void) createTotalStatisticsRequest:(NSInteger) type
                              success:(CDRequestSuccess) successHandler
                               failed:(CDRequestFailed) failedHandler
                             complete:(CDRequestComplete) completeHandler{
    CDRequestObservice* observice = [[CDRequestObservice alloc] initWithSuccess:successHandler failed:failedHandler complete:completeHandler];
    
    CDJsonRequest* request = [[TotalStatisticsRequest alloc] initWithType:type];
    [[CDRequestManager shareInstance] createRequest:request observice:observice];
}
@end
