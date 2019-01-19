//
//  UserDefaults.m
//  CherryGrow
//
//  Created by YinQ on 2018/10/24.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import "UserDefaults.h"
#import "UserAccountModel.h"
#import "UserModel.h"
#import "KidInfoModel.h"

static UserDefaults* shareInstance = nil;

static NSString* savedAccountKey = @"savedAccount";
static NSString* savedPasswordKey = @"savedPassword";

static NSString* loginedUserAccountKey = @"loginedUserAccount";
static NSString* loginedUserKey = @"loginedUser";
static NSString* kidInfoModelKey = @"kidInfoModel";

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

- (UserAccountModel*) savedAccountModel{
    NSString* account = [self.userdefaults valueForKey:savedAccountKey];
    NSString* password = [self.userdefaults valueForKey:savedPasswordKey];
    UserAccountModel* accountModel = nil;
    if (account && [account isNotBlank]) {
        accountModel = [[UserAccountModel alloc] initWithAccount:account password:password];
    }
    return accountModel;
}

- (void) setLoginedUserAccount:(UserAccountModel *)loginedUserAccount{
    if (!loginedUserAccount) {
        [self.userdefaults removeObjectForKey:loginedUserAccountKey];
        
    }
    else{
        NSDictionary* accountDictionary = [loginedUserAccount mj_keyValues];
        [self.userdefaults setValue:accountDictionary forKey:loginedUserAccountKey];
        
        [self.userdefaults setValue:loginedUserAccount.account forKey:savedAccountKey];
        [self.userdefaults setValue:loginedUserAccount.password forKey:savedPasswordKey];
    }
    
    [self.userdefaults synchronize];
}

- (UserModel*) loginedUserModel{
    NSDictionary* userDictionary = [self.userdefaults valueForKey:loginedUserKey];
    if (userDictionary) {
        UserModel* user = [UserModel mj_objectWithKeyValues:userDictionary];
        return user;
    }
    return nil;
}

- (void) setLoginedUserModel:(UserModel *)loginedUserModel{
    if (!loginedUserModel) {
        [self.userdefaults removeObjectForKey:loginedUserKey];
    }
    else{
        NSDictionary* userDictionary = [loginedUserModel mj_keyValues];
        [self.userdefaults setValue:userDictionary forKey:loginedUserKey];
        
        
    }
    
    [self.userdefaults synchronize];
}

- (NSString*) loginedUserId{
    UserModel* loginedUser = self.loginedUserModel;
    NSString* loginedUserId = @"0";
    if (loginedUser) {
        loginedUserId = loginedUser.userId;
    }
    return loginedUserId;
}

- (KidInfoModel*) kidInfoModel{
    NSDictionary* kidInfoDictionary = [self.userdefaults valueForKey:kidInfoModelKey];
    if (kidInfoDictionary) {
        KidInfoModel* kidInfoModel = [KidInfoModel mj_objectWithKeyValues:kidInfoDictionary];
        return kidInfoModel;
    }
    return nil;
}

- (void) setKidInfoModel:(KidInfoModel *)kidInfoModel{
    if (!kidInfoModel) {
        [self.userdefaults removeObjectForKey:kidInfoModelKey];
    }
    else{
        [self.userdefaults setObject:[kidInfoModel mj_keyValues] forKey:kidInfoModelKey];
    }
}

- (NSInteger) kidId{
    KidInfoModel* kidInfoModel = self.kidInfoModel;
    if (!kidInfoModel) {
        return 0;
    }
    return kidInfoModel.id;
}
@end
