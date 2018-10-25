//
//  UIColor+StandardExt.m
//  CherryGrow
//
//  Created by YinQ on 2018/10/24.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import "UIColor+StandardExt.h"

@implementation UIColor (StandardExt)

+ (UIColor*) commonTranseColor{
    UIColor* color = [UIColor colorWithRGB:0x888888 alpha:0.5];
    
    return color;
}

+ (UIColor*) commonBackgroundColor{
    UIColor* color = [UIColor colorWithHexString:@"FCFCFC"];
    return color;
}

//常规控件border颜色
+ (UIColor*) commonControlBorderColor
{
    UIColor* borderColor = [UIColor colorWithHexString:@"DFDFDF"];
    return borderColor;
}

+ (UIColor*) mainThemeColor{
    //235 82 61
    UIColor* borderColor = [UIColor colorWithHexString:@"EB523D"];
    return borderColor;
}

+ (UIColor*) commonTextColor{
    UIColor* color = [UIColor colorWithHexString:@"333333"];
    return color;
}

+ (UIColor*) commonGrayTextColor{
    UIColor* color = [UIColor colorWithHexString:@"999999"];
    return color;
}

+ (UIColor*) commonLightGrayTextColor{
    UIColor* color = [UIColor colorWithHexString:@"BBBBBB"];
    return color;
}
@end
