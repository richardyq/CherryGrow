//
//  UserInfoRequest.h
//  CherryGrow
//
//  Created by YinQ on 2018/11/1.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import "CDJsonRequest.h"

@interface UserInfoRequest : CDJsonRequest

- (id) initWithUserId:(NSString*) userId;

@end
