//
//  NSObject+AlertExt.m
//  CherryGrow
//
//  Created by YinQ on 2018/10/24.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import "NSObject+AlertExt.h"

@implementation NSObject (AlertExt)

+ (void) showAlert:(NSString*) message{
    [self showAlert:message title:nil];
}

+ (void) showAlert:(NSString*) message title:(NSString*) title{
    /*
     UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title   message:message preferredStyle:UIAlertControllerStyleAlert];
     UIViewController* topmostController = [self topMostController];
     
     UIAlertAction* okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
     [alertController addAction:okAction];
     
     [topmostController presentViewController:alertController animated:YES completion:nil];
     */
    [self showAlert:message title:title confirmTitle:@"确定" comfirmHandler:nil cancelTitle:nil];
}

+ (void) showAlert:(NSString *)message
             title:(NSString *)title
      confirmTitle:(NSString*) confirmTitle
    comfirmHandler:(AlertActionHandler)confirmHandler
       cancelTitle:(NSString*) cancelTitle
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title   message:message preferredStyle:UIAlertControllerStyleAlert];
    UIViewController* topmostController = [self topMostController];
    NSString* okTitle = @"确定";
    if (confirmTitle && confirmTitle.length > 0) {
        okTitle = confirmTitle;
    }
    
    UIAlertAction* okAction = [UIAlertAction actionWithTitle:okTitle style:UIAlertActionStyleDefault handler:confirmHandler];
    [alertController addAction:okAction];
    
    if (cancelTitle && cancelTitle.length > 0) {
        UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:cancelTitle style:UIAlertActionStyleCancel handler:nil];
        [alertController addAction:cancelAction];
    }
    
    [topmostController presentViewController:alertController animated:YES completion:nil];
}
@end
