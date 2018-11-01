//
//  InitializationUtil.m
//  CherryGrow
//
//  Created by YinQ on 2018/10/24.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import "InitializationUtil.h"
#import "UserAccountModel.h"
#import "UserUtil.h"

@interface InitializationUtil ()

@end


@implementation InitializationUtil

- (void) startInitialize{
    //获取已经登录的账户信息
    UserAccountModel* loginedAccount = [[UserDefaults shareInstance] loginedUserAccount];
    if (YES) {
//    if (!loginedAccount) {
        //用户还没登录，进入登录界面，进行登录
        [[PageViewControllerManager defaultManager] entryUserLoginPage];
        return;
    }
    
    [self startAutoLogin:loginedAccount];
}



- (void) startAutoLogin:(UserAccountModel*) account{
    [self startLoadUserInfo:account];
}

- (void) startLoadUserInfo:(UserAccountModel*) account{
    UserModel* user = [UserUtil getUserModelWithAccount:account.account];
    if (user) {
        [[UserDefaults shareInstance] setLoginedUserModel:user];
        [self userInfoLoaded];
        return;
    }
    [NSObject showAlert:@"无法找到用户信息。"];
}

- (void) userInfoLoaded{
    [[PageViewControllerManager defaultManager] entryMainStartPage];
}

@end
