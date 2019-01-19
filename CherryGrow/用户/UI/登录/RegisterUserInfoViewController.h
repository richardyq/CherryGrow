//
//  RegisterUserInfoViewController.h
//  CherryGrow
//
//  Created by YinQ on 2018/12/26.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import "BasePageViewController.h"

@class UserAccountModel;
@class KidInfoModel;

@interface RegisterUserInfoViewController : BasePageViewController

- (id) initWithAccountModel:(UserAccountModel*) accountModel
                    kidInfo:(KidInfoModel*) kidInfo;

@end
