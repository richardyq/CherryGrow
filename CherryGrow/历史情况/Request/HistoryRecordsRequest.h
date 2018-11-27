//
//  HistoryRecordsRequest.h
//  CherryGrow
//
//  Created by YinQ on 2018/11/27.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import "CDJsonRequest.h"

@interface HistoryRecordsRequestParam : NSObject

@property (nonatomic, assign) NSInteger type;
@property (nonatomic, assign) NSInteger startRow;
@property (nonatomic, assign) NSInteger rows;

@property (nonatomic, strong) NSString* startDate;
@property (nonatomic, strong) NSString* endDate;

@end

@interface HistoryRecordsRequest : CDJsonRequest

- (id) initWithType:(NSInteger) type
           startRow:(NSInteger) startRow
               rows:(NSInteger) rows
          startDate:(NSString*) startDate
            endDate:(NSString*) endDate;
@end
