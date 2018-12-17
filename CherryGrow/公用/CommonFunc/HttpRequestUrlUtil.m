//
//  HttpRequestUrlUtil.m
//  CherryGrow
//
//  Created by YinQ on 2018/11/1.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import "HttpRequestUrlUtil.h"

//static NSString* const postUrl = @"http://118.24.222.102:8080/CherryDialyRecord/base.do";
static NSString* const postUrl = @"http://127.0.0.1:8080/CherryDialyRecord/base.do";

@implementation HttpRequestUrlUtil

+ (NSString*) requestUrl:(NSString*) service method:(NSString*) method{
    NSString* url = [postUrl stringByAppendingFormat:@"?service=%@&method=%@", service, method];
    return url;
}
@end
