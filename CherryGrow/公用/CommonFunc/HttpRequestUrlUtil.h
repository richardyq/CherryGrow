//
//  HttpRequestUrlUtil.h
//  CherryGrow
//
//  Created by YinQ on 2018/11/1.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HttpRequestUrlUtil : NSObject

+ (NSString*) requestUrl:(NSString*) service method:(NSString*) method;

@end
