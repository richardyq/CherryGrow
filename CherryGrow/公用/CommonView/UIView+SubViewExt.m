//
//  UIView+SubViewExt.m
//  CherryGrow
//
//  Created by YinQ on 2018/10/24.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import "UIView+SubViewExt.h"

@implementation UIView (SubViewExt)

- (UIImageView*) addImageView:(NSString*) imgName{
    UIImageView* imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imgName]];
    [self addSubview:imageView];
    return imageView;
}

- (UILabel*) addLabel{
    UILabel* label = [UILabel new];
    [self addSubview:label];
    return label;
}

- (UITextField*) addTextField:(NSString*) placeholder{
    UITextField* textfiled = [UITextField new];
    [self addSubview:textfiled];
    textfiled.placeholder = placeholder;
    return textfiled;
}

- (UIButton*) addButton:(UIButtonType) buttonType{
    UIButton* button = [UIButton buttonWithType:buttonType];
    [self addSubview:button];
    return button;
}

@end
