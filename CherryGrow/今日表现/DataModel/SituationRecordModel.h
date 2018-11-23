//
//  SituationRecordModel.h
//  CherryGrow
//
//  Created by YinQ on 2018/11/23.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SituationRecordModel : NSObject

@property (nonatomic, strong) NSString* id;
@property (nonatomic, strong) NSString* date;
@property (nonatomic, strong) UserModel* user;
@property (nonatomic, strong) NSString* updateTime;
@property (nonatomic, assign) NSInteger type;

@end
