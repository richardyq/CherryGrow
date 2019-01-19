//
//  ValidLoginAccountRequest.h
//  CherryGrow
//
//  Created by YinQ on 2018/12/26.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import "CDJsonRequest.h"

@interface ValidLoginAccountRequest : CDJsonRequest

- (id) initWithAccount:(NSString*) account;

@end
