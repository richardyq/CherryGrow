//
//  UserRequestUtil.m
//  CherryGrow
//
//  Created by YinQ on 2018/11/1.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import "UserRequestUtil.h"
#import "UserLoginRequest.h"
#import "UserInfoRequest.h"

@implementation UserRequestUtil

+ (void) createLoginRequst:(NSString*) account
                  password:(NSString*) password
                   success:(CDRequestSuccess) successHandler
                    failed:(CDRequestFailed) failedHandler
                  complete:(CDRequestComplete) completeHandler{
    CDRequestObservice* observice = [[CDRequestObservice alloc] initWithSuccess:successHandler failed:failedHandler complete:completeHandler];
    CDJsonRequest* request = [[UserLoginRequest alloc] initWithAccount:account password:password];
    [[CDRequestManager shareInstance] createRequest:request observice:observice];
}

+ (void) createGetUserInfoRequest:(NSString*) userId
                          success:(CDRequestSuccess) successHandler
                           failed:(CDRequestFailed) failedHandler
                         complete:(CDRequestComplete) completeHandler{
    CDRequestObservice* observice = [[CDRequestObservice alloc] initWithSuccess:successHandler failed:failedHandler complete:completeHandler];
    CDJsonRequest* request = [[UserInfoRequest alloc] initWithUserId:userId];
    [[CDRequestManager shareInstance] createRequest:request observice:observice];
}

@end
