//
//  HistoryRequestManager.h
//  CherryGrow
//
//  Created by YinQ on 2018/11/27.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HistoryRequestManager : NSObject

+ (void) createHistoryRecordRequest:(NSInteger) type
                           startRow:(NSInteger) startRow
                               rows:(NSInteger) rows
                          startDate:(NSString*) startDate
                            endDate:(NSString*) endDate
                            success:(CDRequestSuccess) successHandler
                             failed:(CDRequestFailed) failedHandler
                           complete:(CDRequestComplete) completeHandler;

@end
