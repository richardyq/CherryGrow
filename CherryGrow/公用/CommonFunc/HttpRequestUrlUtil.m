//
//  HttpRequestUrlUtil.m
//  CherryGrow
//
//  Created by YinQ on 2018/11/1.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import "HttpRequestUrlUtil.h"

static NSString* const postUrl = @"http://148.70.21.73:8080/CherryDialyRecord/base.do";

@implementation HttpRequestUrlUtil

+ (NSString*) requestUrl:(NSString*) service method:(NSString*) method{
    NSString* url = [postUrl stringByAppendingFormat:@"?service=%@&method=%@", service, method];
    return url;
}
@end
