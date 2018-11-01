//
//  UserInfoRequest.m
//  CherryGrow
//
//  Created by YinQ on 2018/11/1.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import "UserInfoRequest.h"
#import "UserModel.h"

@implementation UserInfoRequest

@synthesize paramDictionary = _paramDictionary;

- (id) initWithUserId:(NSString*) userId{
    self = [super init];
    if(self){
        
        NSMutableDictionary* postParam = [NSMutableDictionary dictionary];
        [postParam setValue:userId forKey:@"userId"];
    
        _paramDictionary = postParam;
    }
    return self;
}

- (NSString*) postUrl{
    return @"http://127.0.0.1:8080/ServletExample/CherryTest/CherrySevlet?do=baseInterface&method=getUserInfo&service=userService";
}

- (id) parserResult:(id) result{
    if([result isKindOfClass:[NSDictionary class]]){
        NSDictionary* respDictionary = (NSDictionary*) result;
        UserModel* model = [UserModel mj_objectWithKeyValues:respDictionary];
        return model;
    }
    return result;
}
@end
