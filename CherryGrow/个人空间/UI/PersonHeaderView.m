//
//  PersonHeaderView.m
//  CherryGrow
//
//  Created by YinQ on 2018/12/19.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import "PersonHeaderView.h"
#import "UserModel.h"

@interface PersonHeaderView ()

@property (nonatomic, strong) UIImageView* portraitImageView;
@property (nonatomic, strong) UILabel* nameLabel;
@property (nonatomic, strong) UILabel* relationLabel;

@end

@implementation PersonHeaderView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor mainThemeColor];
        [self layoutElements];
        
        UserModel* user = [UserDefaults shareInstance].loginedUserModel;
        
        self.nameLabel.text = user.userName;
        self.relationLabel.text = user.relation;
    }
    return self;
}

- (void) layoutElements{
    [self.portraitImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(44, 44));
        make.left.equalTo(self).offset(15);
    }];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.portraitImageView.mas_right).offset(8);
        make.top.equalTo(self.portraitImageView);
    }];
    
    [self.relationLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nameLabel);
        make.bottom.equalTo(self.portraitImageView);
    }];
}

#pragma mark - settingAndGetting
- (UIImageView*) portraitImageView{
    if (!_portraitImageView) {
        _portraitImageView = [self addImageView:@"default_portrait"];
        [_portraitImageView setCornerRadius:22];
    }
    return _portraitImageView;
}

- (UILabel*) nameLabel{
    if (!_nameLabel) {
        _nameLabel = [self addLabel];
        _nameLabel.font = [UIFont systemFontOfSize:16];
        _nameLabel.textColor = [UIColor whiteColor];
    }
    return _nameLabel;
}

- (UILabel*) relationLabel{
    if (!_relationLabel) {
        _relationLabel = [self addLabel];
        _relationLabel.font = [UIFont systemFontOfSize:13];
        _relationLabel.textColor = [UIColor whiteColor];
    }
    return _relationLabel;
}
@end
