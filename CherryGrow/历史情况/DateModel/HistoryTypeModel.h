//
//  HistoryTypeModel.h
//  CherryGrow
//
//  Created by YinQ on 2018/12/5.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, EHistoryType) {
    HistoryType_All,
    HistoryType_Meal,
    HistoryType_Sleep,
    HistoryType_Interest,
};

@interface HistoryTypeModel : NSObject

@property (nonatomic, assign) EHistoryType type;
@property (nonatomic, readonly) NSString* typeName;

+ (HistoryTypeModel*) typeModel:(EHistoryType) type;

@end
