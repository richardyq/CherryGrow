//
//  CommonInputTextView.m
//  CherryGrow
//
//  Created by YinQ on 2018/12/26.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import "CommonInputTextView.h"

@interface CommonInputTextView ()


@property (nonatomic, strong) UILabel* nameLabel;
@property (nonatomic, strong) UILabel* mustLabel;

@end

@implementation CommonInputTextView
@synthesize textField = _textField;
- (id) initWithName:(NSString*) name placeHolder:(NSString*) placeholder{
    self = [super init];
    if (self) {
        
        [self layoutElements];
        self.nameLabel.text = name;
        self.textField.placeholder = placeholder;
        self.backgroundColor = [UIColor whiteColor];
        [self showBoarder:UIViewBorderLineTypeBottom];
        
        
    }
    return self;
}

- (void) layoutElements{
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.equalTo(self).offset(12.5);
    }];
    
    [self.mustLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.right.equalTo(self.nameLabel.mas_left).offset(-2);
    }];
    
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.right.equalTo(self).offset(-12.5);
        make.left.equalTo(self.nameLabel.mas_right);
        make.width.equalTo(self.nameLabel).multipliedBy(2);
    }];
}

#pragma mark - settingAndGetting
- (UILabel*) nameLabel{
    if (!_nameLabel) {
        _nameLabel = [self addLabel];
        _nameLabel.font = [UIFont systemFontOfSize:14];
        _nameLabel.textColor = [UIColor commonTextColor];
    }
    return _nameLabel;
}

- (UILabel*) mustLabel{
    if (!_mustLabel) {
        _mustLabel = [self addLabel];
        _mustLabel.font = [UIFont systemFontOfSize:13];
        _mustLabel.textColor = [UIColor mainThemeColor];
        _mustLabel.text = @"*";
    }
    return _mustLabel;
}

- (UITextField*) textField{
    if (!_textField) {
        _textField = [self addTextField:nil];
        _textField.textColor = [UIColor commonTextColor];
        _textField.font = [UIFont systemFontOfSize:15];
    }
    return _textField;
}

- (BOOL) secureTextEntry{
    return self.textField.secureTextEntry;
}

- (void) setSecureTextEntry:(BOOL)secureTextEntry{
    [self.textField setSecureTextEntry:secureTextEntry];
}

-(UIKeyboardType) keyboardType{
    return self.textField.keyboardType;
}

- (void) setKeyboardType:(UIKeyboardType)keyboardType{
    [self.textField setKeyboardType:keyboardType];
}

- (UITextAutocorrectionType) autocorrectionType{
    return self.textField.autocorrectionType;
}

- (void) setAutocorrectionType:(UITextAutocorrectionType)autocorrectionType{
    [self.textField setAutocorrectionType:autocorrectionType];
}

- (UITextAutocapitalizationType) autocapitalizationType{
    return self.textField.autocapitalizationType;
}

- (void) setAutocapitalizationType:(UITextAutocapitalizationType)autocapitalizationType{
    [self.textField setAutocapitalizationType:autocapitalizationType];
}


- (NSString*) text{
    return self.textField.text;
}

- (void) setMustFill:(BOOL)mustFill{
    _mustFill = mustFill;
    self.mustLabel.hidden = !mustFill;
}
@end
