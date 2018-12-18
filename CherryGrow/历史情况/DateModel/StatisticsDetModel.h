//
//  StatisticsDetModel.h
//  CherryGrow
//
//  Created by YinQ on 2018/12/18.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StatisticsDetModel : NSObject

@property (nonatomic, strong) NSString* month;
@property (nonatomic, assign) NSInteger count;
@property (nonatomic, assign) CGFloat score;

@end
