//
//  DatePickerViewController.h
//  CherryGrow
//
//  Created by YinQ on 2018/12/5.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import "PopViewController.h"

typedef void(^DatePickerHandler)(NSString* dateString);

@interface DatePickerViewController : PopViewController

+ (void) showWithDate:(NSDate*) date handler:(DatePickerHandler) handler;
@end
