//
//  CommonInputTextView.h
//  CherryGrow
//
//  Created by YinQ on 2018/12/26.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommonInputTextView : UIView

@property (nonatomic, readonly) NSString* text;
@property (nonatomic, assign) BOOL secureTextEntry;
@property (nonatomic, assign) UIKeyboardType keyboardType;
@property (nonatomic, assign) UITextAutocorrectionType autocorrectionType;
@property (nonatomic, assign) UITextAutocapitalizationType autocapitalizationType;

@property (nonatomic, assign) BOOL mustFill;    //必填

@property (nonatomic, readonly) UITextField* textField;

- (id) initWithName:(NSString*) name placeHolder:(NSString*) placeholder;

@end
