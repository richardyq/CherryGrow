//
//  NSObject+AlertExt.h
//  CherryGrow
//
//  Created by YinQ on 2018/10/24.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^AlertActionHandler)(UIAlertAction *action);

@interface NSObject (AlertExt)

+ (void) showAlert:(NSString*) message;

+ (void) showAlert:(NSString*) message title:(NSString*) title;

+ (void) showAlert:(NSString *)message
             title:(NSString *)title
      confirmTitle:(NSString*) confirmTitle
    comfirmHandler:(AlertActionHandler)confirmHandler
       cancelTitle:(NSString*) cancelTitle;

@end
