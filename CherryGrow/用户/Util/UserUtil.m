//
//  UserUtil.m
//  CherryGrow
//
//  Created by YinQ on 2018/10/24.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import "UserUtil.h"
#import "UserRequestUtil.h"
#import "UserAccountModel.h"
#import "UserModel.h"

@implementation UserUtil

+ (UserModel*) getUserModelWithAccount:(NSString*) account{
    NSString* plistPath = [[NSBundle mainBundle].bundlePath stringByAppendingPathComponent:@"UserList.plist"];
    NSArray<NSDictionary*>* userDictList = [NSArray arrayWithContentsOfFile:plistPath];
    __block UserModel* foundUser = nil;
//    NSMutableArray<UserModel*>* userList = [NSMutableArray<UserModel*> array];
    [userDictList enumerateObjectsUsingBlock:^(NSDictionary * _Nonnull dict, NSUInteger idx, BOOL * _Nonnull stop) {
        UserModel* user = [UserModel mj_objectWithKeyValues:dict];

        if ([user.account isEqualToString:account]) {
            foundUser = user;
            *stop = YES;
            return ;
        }
    }];
    
    return foundUser;
}

+ (void) startLogin:(NSString*) account
           password:(NSString*) password
            success:(CherrySuccessHandler) success
             failed:(CherryFailedHandler) fail{
    
    __block UserAccountModel* userAccount = nil;
    [UserRequestUtil createLoginRequst:account password:password success:^(id result) {
        //登录接口调用成功
        
        userAccount = (UserAccountModel*) result;
        [[UserDefaults shareInstance] setLoginedUserAccount:userAccount];
        
        
    } failed:^(NSInteger errorCode, NSString *message) {
        [NSObject showAlert:message];
        if (fail) {
            fail(errorCode, message);
        }
    } complete:^(NSInteger errorCode) {
        if(success && errorCode == 0){
            success(userAccount);
        }
    }];
}

+ (void) startGetUserInfo:(NSString*) userId
                  success:(CherrySuccessHandler) success
                   failed:(CherryFailedHandler) fail{
    __block UserModel* userInfo = nil;
    [UserRequestUtil createGetUserInfoRequest:userId success:^(id result) {
        userInfo = (UserModel*) result;
        
        if(success){
            success(userInfo);
        }
    } failed:^(NSInteger errorCode, NSString *message) {
        [NSObject showAlert:message];
        if (fail) {
            fail(errorCode, message);
        }
    } complete:^(NSInteger errorCode) {
        
    }];
}
@end
