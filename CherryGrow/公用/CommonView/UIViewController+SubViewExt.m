//
//  UIViewController+SubViewExt.m
//  CherryGrow
//
//  Created by YinQ on 2018/10/24.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import "UIViewController+SubViewExt.h"

@implementation UIViewController (SubViewExt)

- (UIImageView*) addImageView:(NSString*) imgName{
    UIImageView* imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imgName]];
    [self.view addSubview:imageView];
    return imageView;
}

- (UILabel*) addLabel{
    UILabel* label = [UILabel new];
    [self.view addSubview:label];
    return label;
}

- (UITextField*) addTextField:(NSString*) placeholder{
    UITextField* textfiled = [UITextField new];
    [self.view addSubview:textfiled];
    textfiled.placeholder = placeholder;
    return textfiled;
}

- (UIButton*) addButton:(UIButtonType) buttonType{
    UIButton* button = [UIButton buttonWithType:buttonType];
    [self.view addSubview:button];
    return button;
}

@end
