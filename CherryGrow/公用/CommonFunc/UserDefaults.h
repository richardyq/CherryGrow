//
//  UserDefaults.h
//  CherryGrow
//
//  Created by YinQ on 2018/10/24.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UserAccountModel;
@class UserModel;

@interface UserDefaults : NSObject

+ (UserDefaults*) shareInstance;

/*
 loginedUserAccount
 已经登录的用户账号
 */
@property (nonatomic, strong) UserAccountModel* loginedUserAccount;

/*
 loginedUserModel
 当前登录的用户信息
 */
@property (nonatomic, strong) UserModel* loginedUserModel;

@property (nonatomic, readonly) NSString* loginedUserId;

@end
