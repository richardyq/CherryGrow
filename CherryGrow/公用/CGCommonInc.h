//
//  CGCommonInc.h
//  CherryGrow
//
//  Created by YinQ on 2018/10/24.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#ifndef CGCommonInc_h
#define CGCommonInc_h

#import "UserDefaults.h"
#import "HttpRequestUrlUtil.h"

#import "NSObject+RootControllerExt.h"
#import "UIView+SubViewExt.h"
#import "PopViewController.h"
#import "UIViewController+SubViewExt.h"
#import "UIView+BoarderExt.h"
#import "UIColor+StandardExt.h"
#import "UIImage+ShapeExt.h"
#import "NSObject+AlertExt.h"

#import "PageViewControllerManager.h"


typedef void(^CherrySuccessHandler)(id result);
typedef void(^CherryFailedHandler)(NSInteger errCode, NSString* errMsg);

#endif /* CGCommonInc_h */
