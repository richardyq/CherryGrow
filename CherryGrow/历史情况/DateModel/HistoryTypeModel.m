//
//  HistoryTypeModel.m
//  CherryGrow
//
//  Created by YinQ on 2018/12/5.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import "HistoryTypeModel.h"

@implementation HistoryTypeModel

+ (HistoryTypeModel*) typeModel:(EHistoryType) type{
    HistoryTypeModel* typeModel = [HistoryTypeModel new];
    typeModel.type = type;
    return typeModel;
}

- (NSString*) typeName{
    NSString* typeName = nil;
    switch (self.type) {
        case HistoryType_All:{
            typeName = @"全部";
            break;
        }
        case HistoryType_Meal:{
            typeName = @"吃饭";
            break;
        }
        case HistoryType_Sleep:{
            typeName = @"睡觉";
            break;
        }
        case HistoryType_Interest:{
            typeName = @"兴趣学习";
            break;
        }
        default:
            break;
    }
    
    return typeName;
}

@end
