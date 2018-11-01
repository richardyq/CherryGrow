//
//  UserAccountModel.h
//  CherryGrow
//
//  Created by YinQ on 2018/10/24.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserAccountModel : NSObject

@property (nonatomic, strong) NSString* account;
@property (nonatomic, strong) NSString* password;
@property (nonatomic, strong) NSString* userId;
@property (nonatomic, strong) NSString* lastLoginDateTime;

- (id) initWithAccount:(NSString*) account password:(NSString*) password;
@end
