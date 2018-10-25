//
//  UserDefaults.m
//  CherryGrow
//
//  Created by YinQ on 2018/10/24.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import "UserDefaults.h"
#import "UserAccountModel.h"

static UserDefaults* shareInstance = nil;

static NSString* loginedUserAccountKey = @"loginedUserAccount";

@interface UserDefaults ()

@property (nonatomic, readonly) NSUserDefaults* userdefaults;

@end

@implementation UserDefaults

+ (UserDefaults*) shareInstance{
    if (!shareInstance) {
        shareInstance = [UserDefaults new];
    }
    return shareInstance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _userdefaults = [NSUserDefaults standardUserDefaults];
    }
    return self;
}

#pragma mark - settingAndGetting
- (UserAccountModel*) loginedUserAccount{
    NSDictionary* accountDictionary = [self.userdefaults valueForKey:loginedUserAccountKey];
    if (accountDictionary ) {
        UserAccountModel* userAccount = [UserAccountModel mj_objectWithKeyValues:accountDictionary];
        return userAccount;
    }
    
    return nil;
}

- (void) setLoginedUserAccount:(UserAccountModel *)loginedUserAccount{
    if (!loginedUserAccount) {
        [self.userdefaults removeObjectForKey:loginedUserAccountKey];
        
    }
    else{
        NSDictionary* accountDictionary = [loginedUserAccount mj_keyValues];
        [self.userdefaults setValue:accountDictionary forKey:loginedUserAccountKey];
    }
    
    [self.userdefaults synchronize];
}
@end
