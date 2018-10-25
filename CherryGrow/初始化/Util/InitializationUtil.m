//
//  InitializationUtil.m
//  CherryGrow
//
//  Created by YinQ on 2018/10/24.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import "InitializationUtil.h"
#import "UserAccountModel.h"

@interface InitializationUtil ()

@end


@implementation InitializationUtil

- (void) startInitialize{
    //获取已经登录的账户信息
    UserAccountModel* loginedAccount = [[UserDefaults shareInstance] loginedUserAccount];
    if (!loginedAccount) {
        //用户还没登录，进入登录界面，进行登录
        [[PageViewControllerManager defaultManager] entryUserLoginPage];
        return;
    }
    
}


- (BOOL) userHasBeenLogined{
    BOOL userHasBeenLogined = NO;
    
    
    return userHasBeenLogined;
}

@end
