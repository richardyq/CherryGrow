//
//  UserLoginRequest.m
//  CherryGrow
//
//  Created by YinQ on 2018/11/1.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import "UserLoginRequest.h"
#import "UserAccountModel.h"

@implementation UserLoginRequest
@synthesize paramDictionary = _paramDictionary;

- (id) initWithAccount:(NSString*) account
              password:(NSString*) password{
    self = [super init];
    if(self){
        
        NSMutableDictionary* postParam = [NSMutableDictionary dictionary];
        [postParam setValue:account forKey:@"account"];
        [postParam setValue:password forKey:@"password"];
        
        _paramDictionary = postParam;
    }
    return self;
}

- (NSString*) postUrl{
    return [HttpRequestUrlUtil requestUrl:@"userService" method:@"login"];
    
}

- (id) parserResult:(id) result{
    if([result isKindOfClass:[NSDictionary class]]){
        NSDictionary* respDictionary = (NSDictionary*) result;
        UserAccountModel* model = [UserAccountModel mj_objectWithKeyValues:respDictionary];
        return model;
    }
    return result;
}
@end
