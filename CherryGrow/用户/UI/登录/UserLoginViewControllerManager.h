//
//  UserLoginViewControllerManager.h
//  CherryGrow
//
//  Created by YinQ on 2018/12/26.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserLoginViewControllerManager : NSObject

+ (void) entryRegisterPage;

+ (void) entryRegisterUserInfoPage:(UserAccountModel*) accountModel
                           kidInfo:(KidInfoModel*) kidInfo;

+ (void) entryRegisterKidInfoPage:(UserAccountModel*) accountModel;

@end
