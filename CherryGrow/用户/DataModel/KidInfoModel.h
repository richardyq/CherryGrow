//
//  KidInfoModel.h
//  CherryGrow
//
//  Created by YinQ on 2018/12/17.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KidInfoModel : NSObject

@property (nonatomic, assign) NSInteger id;
@property (nonatomic, assign) NSInteger gender;
@property (nonatomic, strong) NSString* name;
@property (nonatomic, strong) NSString* birthday;
@property (nonatomic, strong) NSString* nickname;

@end
