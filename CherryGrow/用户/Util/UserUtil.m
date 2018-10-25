//
//  UserUtil.m
//  CherryGrow
//
//  Created by YinQ on 2018/10/24.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import "UserUtil.h"

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
@end
