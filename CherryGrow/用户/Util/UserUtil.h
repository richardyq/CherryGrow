//
//  UserUtil.h
//  CherryGrow
//
//  Created by YinQ on 2018/10/24.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserModel.h"

@interface UserUtil : NSObject

+ (UserModel*) getUserModelWithAccount:(NSString*) account;
@end
