//
//  UserRequestUtil.h
//  CherryGrow
//
//  Created by YinQ on 2018/11/1.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserRequestUtil : NSObject

+ (void) createLoginRequst:(NSString*) account
                  password:(NSString*) password
                   success:(CDRequestSuccess) successHandler
                    failed:(CDRequestFailed) failedHandler
                  complete:(CDRequestComplete) completeHandler;


@end
