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

- (id) initWithAccount:(NSString*) account password:(NSString*) password;
@end
