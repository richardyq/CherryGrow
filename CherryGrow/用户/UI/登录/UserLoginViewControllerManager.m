//
//  UserLoginViewControllerManager.m
//  CherryGrow
//
//  Created by YinQ on 2018/12/26.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import "UserLoginViewControllerManager.h"
#import "RegisterAccountViewController.h"
#import "RegisterUserInfoViewController.h"
#import "RegisterKidInfoViewController.h"

@implementation UserLoginViewControllerManager

+ (void) entryRegisterPage{
    RegisterAccountViewController* registerViewController = [[RegisterAccountViewController alloc] init];
    BaseNavigationController* navigationController = [[BaseNavigationController alloc] initWithRootViewController:registerViewController];
    
    UIViewController* topmostController = [NSObject topMostController];
    [topmostController presentViewController:navigationController animated:YES completion:nil];
}

+ (void) entryRegisterUserInfoPage:(UserAccountModel*) accountModel
                           kidInfo:(KidInfoModel*) kidInfo{
    RegisterUserInfoViewController* registerViewController = [[RegisterUserInfoViewController alloc] initWithAccountModel:accountModel kidInfo:kidInfo];
    [[PageViewControllerManager defaultManager] createPageController:registerViewController];
}

+ (void) entryRegisterKidInfoPage:(UserAccountModel*) accountModel{
    RegisterKidInfoViewController* registerViewController = [[RegisterKidInfoViewController alloc] initWithAccountModel:accountModel];
    [[PageViewControllerManager defaultManager] createPageController:registerViewController];
}
@end
