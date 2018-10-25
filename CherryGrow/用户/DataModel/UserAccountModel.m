//
//  UserAccountModel.m
//  CherryGrow
//
//  Created by YinQ on 2018/10/24.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import "UserAccountModel.h"

@implementation UserAccountModel

- (id) initWithAccount:(NSString*) account password:(NSString*) password{
    self = [super init];
    if (self) {
        _account = account;
        _password = password;
    }
    return self;
}
@end
