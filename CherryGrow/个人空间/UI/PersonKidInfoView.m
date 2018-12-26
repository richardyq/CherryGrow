//
//  PersonKidInfoView.m
//  CherryGrow
//
//  Created by YinQ on 2018/12/19.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import "PersonKidInfoView.h"
#import "KidInfoModel.h"

@interface PersonKidInfoView ()

@property (nonatomic, strong) UILabel* nameLabel;
@property (nonatomic, strong) UILabel* nicknameLabel;

@end

@implementation PersonKidInfoView

- (id) init{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self setCornerRadius:5];
        self.layer.borderColor = [UIColor mainThemeColor].CGColor;
        self.layer.borderWidth = 1;
        
        [self layoutElements];
        
        UserDefaults* userDefaults = [UserDefaults shareInstance];
        KidInfoModel* kidInfoModel = [userDefaults kidInfoModel];
        self.nameLabel.text = kidInfoModel.name;
        self.nicknameLabel.text = kidInfoModel.nickname;
    }
    return self;
}

- (void) layoutElements{
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.equalTo(self).offset(15);
    }];
    
    [self.nicknameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.right.equalTo(self).offset(-15);
    }];
}

#pragma mark - settingAndGetting
- (UILabel*) nameLabel{
    if (!_nameLabel) {
        _nameLabel = [self addLabel];
        _nameLabel.font = [UIFont systemFontOfSize:15];
        _nameLabel.textColor = [UIColor commonTextColor];
    }
    return _nameLabel;
}

- (UILabel*) nicknameLabel{
    if (!_nicknameLabel) {
        _nicknameLabel = [self addLabel];
        _nicknameLabel.font = [UIFont systemFontOfSize:13];
        _nicknameLabel.textColor = [UIColor commonTextColor];
    }
    return _nicknameLabel;
}

@end
