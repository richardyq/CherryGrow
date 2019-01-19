//
//  ValidLoginAccountRequest.m
//  CherryGrow
//
//  Created by YinQ on 2018/12/26.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import "ValidLoginAccountRequest.h"

@implementation ValidLoginAccountRequest
@synthesize paramDictionary = _paramDictionary;

- (id) initWithAccount:(NSString*) account{
    self = [super init];
    if(self){
        
        NSMutableDictionary* postParam = [NSMutableDictionary dictionary];
        [postParam setValue:account forKey:@"account"];
        
        _paramDictionary = postParam;
    }
    return self;
}

- (NSString*) postUrl{
    return [HttpRequestUrlUtil requestUrl:@"userService" method:@"validAccount"];
}


@end
