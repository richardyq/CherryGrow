//
//  InterestSituationSelectViewController.h
//  CherryGrow
//
//  Created by YinQ on 2018/11/26.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import "PopViewController.h"

typedef void(^InterestStatusSelectHandler)(NSInteger cateId, NSInteger status);

@interface InterestSituationSelectViewController : PopViewController

+ (void) showWithCateId:(NSInteger) cateId handler:(InterestStatusSelectHandler) handler;
@end
