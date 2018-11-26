//
//  InterestCateSelectViewController.h
//  CherryGrow
//
//  Created by YinQ on 2018/11/21.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import "PopViewController.h"
#import "InterestCateModel.h"

typedef void(^InterestCateSelectHandler)(InterestCateModel* model);

@interface InterestCateSelectViewController : PopViewController

+ (void) showWithHandler:(InterestCateSelectHandler) handler;


@end
