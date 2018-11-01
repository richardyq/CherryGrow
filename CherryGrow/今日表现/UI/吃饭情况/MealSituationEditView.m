//
//  MealSituationEditView.m
//  CherryGrow
//
//  Created by YinQ on 2018/10/26.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import "MealSituationEditView.h"
#import "RadioGroup.h"

@interface MealSituationEditView ()

@property (nonatomic, strong) UILabel* titleLabel;

@property (nonatomic, strong) UILabel* askHelpLabel;
@property (nonatomic, strong) RadioGroup* askHelpRadioGroup;

@property (nonatomic, strong) UILabel* speedLabel;
@property (nonatomic, strong) RadioGroup* speedRadioGroup;

@property (nonatomic, strong) UILabel* pickyLabel;
@property (nonatomic, strong) RadioGroup* pickyRadioGroup;

@property (nonatomic, strong) UIButton* submitButton;

@end

@implementation MealSituationEditView

- (id) initWithTitle:(NSString*) title{
    self = [super init];
    if (self) {
        [self setBackgroundColor:[UIColor whiteColor]];
        [self setCornerRadius:5];
        
        self.titleLabel.text = title;
        [self layoutElements];
       
    }
    return self;
}

- (void) layoutElements{
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(12.5);
        make.top.equalTo(self).offset(10);
    }];
    
    [self.askHelpLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLabel);
        make.top.equalTo(self.titleLabel.mas_bottom).offset(15);
    }];
    
    [self.askHelpRadioGroup mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.askHelpLabel.mas_right).offset(10);
        make.right.equalTo(self).offset(-10);
        make.height.mas_equalTo(30);
        make.centerY.equalTo(self.askHelpLabel);
    }];
    
    [self.speedLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.askHelpLabel);
        make.top.equalTo(self.askHelpRadioGroup.mas_bottom).offset(15);
    }];
    
    [self.speedRadioGroup mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.speedLabel.mas_right).offset(10);
        make.right.equalTo(self).offset(-10);
        make.height.mas_equalTo(30);
        make.centerY.equalTo(self.speedLabel);
    }];
    
    [self.pickyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.speedLabel);
        make.top.equalTo(self.speedRadioGroup.mas_bottom).offset(15);
    }];
    
    [self.pickyRadioGroup mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.pickyLabel.mas_right).offset(10);
        make.right.equalTo(self).offset(-10);
        make.height.mas_equalTo(30);
        make.centerY.equalTo(self.pickyLabel);
//        make.bottom.equalTo(self).offset(-12);
    }];
    
    [self.submitButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(150, 35));
        make.top.equalTo(self.pickyRadioGroup.mas_bottom).offset(7);
        make.centerX.equalTo(self);
        make.bottom.equalTo(self).offset(-12);
    }];
}

#pragma mark - settingAndGetting
- (UILabel*) titleLabel{
    if (!_titleLabel) {
        _titleLabel = [self addLabel];
        _titleLabel.font = [UIFont systemFontOfSize:15];
        _titleLabel.textColor = [UIColor commonTextColor];
    }
    return _titleLabel;
}

- (UILabel*) askHelpLabel{
    if (!_askHelpLabel) {
        _askHelpLabel = [self addLabel];
        _askHelpLabel.font = [UIFont systemFontOfSize:13];
        _askHelpLabel.textColor = [UIColor commonTextColor];
        _askHelpLabel.text = @"自己吃：";
    }
    return _askHelpLabel;
}

- (RadioGroup*) askHelpRadioGroup{
    if (!_askHelpRadioGroup) {
        _askHelpRadioGroup = [[RadioGroup alloc] initWithTitles:@[@"要人喂", @"喂一半", @"自己吃"]  orientation:Radio_Horizontal];
        [self addSubview:_askHelpRadioGroup];
    }
    return _askHelpRadioGroup;
}

- (UILabel*) speedLabel{
    if (!_speedLabel) {
        _speedLabel = [self addLabel];
        _speedLabel.font = [UIFont systemFontOfSize:13];
        _speedLabel.textColor = [UIColor commonTextColor];
        _speedLabel.text = @"吃饭速度：";
    }
    return _speedLabel;
}

- (RadioGroup*) speedRadioGroup{
    if (!_speedRadioGroup) {
        _speedRadioGroup = [[RadioGroup alloc] initWithTitles:@[@"慢", @"一般", @"快"]  orientation:Radio_Horizontal];
        [self addSubview:_speedRadioGroup];
    }
    return _speedRadioGroup;
}

- (UILabel*) pickyLabel{
    if (!_pickyLabel) {
        _pickyLabel = [self addLabel];
        _pickyLabel.font = [UIFont systemFontOfSize:13];
        _pickyLabel.textColor = [UIColor commonTextColor];
        _pickyLabel.text = @"是否挑食：";
    }
    return _pickyLabel;
}

- (RadioGroup*) pickyRadioGroup{
    if (!_pickyRadioGroup) {
        _pickyRadioGroup = [[RadioGroup alloc] initWithTitles:@[@"挑食", @"不挑食"]  orientation:Radio_Horizontal];
        [self addSubview:_pickyRadioGroup];
    }
    return _pickyRadioGroup;
}

- (UIButton*) submitButton{
    if (!_submitButton) {
        _submitButton = [self addButton:UIButtonTypeCustom];
        UIImage* bgImage = [UIImage rectImage:[UIColor mainThemeColor] size:CGSizeMake(200, 45)];
        [_submitButton setBackgroundImage:bgImage forState:UIControlStateNormal];
        
        [_submitButton setTitle:@"提交" forState:UIControlStateNormal];
        [_submitButton.titleLabel setFont:[UIFont systemFontOfSize:15]];
        [_submitButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_submitButton setCornerRadius:4.5];
    }
    return _submitButton;
}

@end
