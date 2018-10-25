//
//  UserModel.h
//  CherryGrow
//
//  Created by YinQ on 2018/10/24.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, EUserGender) {
    Gender_Unknown,
    Gender_Male,
    Gender_Female,
    
};

@interface UserModel : NSObject

@property (nonatomic, assign) NSInteger userId;
@property (nonatomic, strong) NSString* account;
@property (nonatomic, strong) NSString* userName;
@property (nonatomic, strong) NSString* mobile;
@property (nonatomic, strong) NSString* relation;
@property (nonatomic, assign) EUserGender gender;
@property (nonatomic, strong) NSString* portraitUrl;

@end
