//
//  HistoryTypeSelectViewController.h
//  CherryGrow
//
//  Created by YinQ on 2018/12/5.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import "PopViewController.h"
#import "HistoryTypeModel.h"

typedef void(^TypeSelectHandler)(HistoryTypeModel* typeModel);

@interface HistoryTypeSelectViewController : PopViewController

+ (HistoryTypeSelectViewController*) showWithHandler:(TypeSelectHandler) handler;
@end
