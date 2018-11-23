//
//  SituationModel.h
//  CherryGrow
//
//  Created by YinQ on 2018/11/23.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "SituationRecordModel.h"
#import "SituationDetModel.h"

@interface SituationModel : NSObject

@property (nonatomic, strong) NSString* id;
@property (nonatomic, strong) NSString* date;
@property (nonatomic, strong) NSString* userId;
@property (nonatomic, strong) NSString* userName;
@property (nonatomic, strong) NSString* updateTime;
@property (nonatomic, assign) NSInteger type;

@property (nonatomic, strong) SituationRecordModel* record;
//@property (nonatomic, strong) SituationDetModel* det;

@end
