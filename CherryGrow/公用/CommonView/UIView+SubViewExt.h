//
//  UIView+SubViewExt.h
//  CherryGrow
//
//  Created by YinQ on 2018/10/24.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (SubViewExt)

- (UIImageView*) addImageView:(NSString*) imgName;

- (UILabel*) addLabel;

- (UITextField*) addTextField:(NSString*) placeholder;

- (UIButton*) addButton:(UIButtonType) buttonType;

@end
