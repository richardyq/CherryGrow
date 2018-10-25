//
//  UserDefaults.h
//  CherryGrow
//
//  Created by YinQ on 2018/10/24.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UserAccountModel;

@interface UserDefaults : NSObject

+ (UserDefaults*) shareInstance;

/*
 loginedUserAccount
 已经登录的用户账号
 */
@property (nonatomic, strong) UserAccountModel* loginedUserAccount;

@end
