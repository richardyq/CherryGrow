//
//  StatisticsStartTableViewCell.m
//  CherryGrow
//
//  Created by YinQ on 2018/12/17.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import "StatisticsStartTableViewCell.h"

@interface StatisticsStartTableViewCell ()

@property (nonatomic, strong) UIView* detView;
@property (nonatomic, strong) UIView* titleView;
@property (nonatomic, strong) UIView* statisticsView;
@property (nonatomic, strong) UILabel* titleLabel;
@property (nonatomic, strong) UIImageView* arrowImageView;

@property (nonatomic, strong) UIView* countView;
@property (nonatomic, strong) UILabel* countTitleLabel;
@property (nonatomic, strong) UILabel* countLabel;

@property (nonatomic, strong) UIView* scoreView;
@property (nonatomic, strong) UILabel* scoreTitleLabel;
@property (nonatomic, strong) UILabel* scoreLabel;

@end

@implementation StatisticsStartTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView setBackgroundColor:[UIColor commonBackgroundColor]];
        [self layoutElements];
    }
    return self;
}

- (void) layoutElements{
    [self.detView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView).insets(UIEdgeInsetsMake(10, 14, 10, 14));
        make.height.mas_equalTo(@72);
    }];
    
    [self.titleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self.detView);
    }];
    
    [self.statisticsView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.detView);
        make.top.equalTo(self.titleView.mas_bottom);
        make.height.equalTo(self.titleView);
    }];
    
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleView).offset(15);
        make.centerY.equalTo(self.titleView);
        
    }];
    
    [self.arrowImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.titleView).offset(-6.5);
        make.centerY.equalTo(self.titleView);
        make.size.mas_equalTo(CGSizeMake(7, 13));
    }];
    
    [self.countView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.equalTo(self.statisticsView);
    }];
    
    [self.scoreView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.right.equalTo(self.statisticsView);
        make.width.equalTo(self.countView);
        make.left.equalTo(self.countView.mas_right);
    }];
    
    [self.countTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.countView).offset(15);
        make.centerY.equalTo(self.countView);
    }];
    
    [self.countLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.countTitleLabel.mas_right).offset(10);
        make.centerY.equalTo(self.countView);
    }];
    
    [self.scoreTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.scoreView).offset(15);
        make.centerY.equalTo(self.scoreView);
    }];
    
    [self.scoreLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.scoreTitleLabel.mas_right).offset(10);
        make.centerY.equalTo(self.scoreView);
    }];
    
}

#pragma mark - settingAndGetting
- (UIView*) detView{
    if (!_detView) {
        _detView = [[UIView alloc] init];
        [_detView setCornerRadius:5];
        [self.contentView addSubview:_detView];
        _detView.backgroundColor = [UIColor whiteColor];
    }
    return _detView;
}

- (UIView*) titleView{
    if (!_titleView) {
        _titleView = [[UIView alloc] init];
        [self.detView addSubview:_titleView];
        _titleView.backgroundColor = [UIColor whiteColor];
        [_titleView showBoarder:UIViewBorderLineTypeBottom];
    }
    return _titleView;
}

- (UIView*) statisticsView{
    if (!_statisticsView) {
        _statisticsView = [[UIView alloc] init];
        [self.detView addSubview:_statisticsView];
        _statisticsView.backgroundColor = [UIColor whiteColor];
    }
    return _statisticsView;
}

- (UILabel*) titleLabel{
    if (!_titleLabel) {
        _titleLabel = [self.titleView addLabel];
        _titleLabel.font = [UIFont systemFontOfSize:13];
        _titleLabel.textColor = [UIColor commonTextColor];
        
    }
    return _titleLabel;
}

- (UIImageView*) arrowImageView{
    if (!_arrowImageView) {
        _arrowImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_x_arrows"]];
        [self.titleView addSubview:_arrowImageView];
    }
    return _arrowImageView;
}

- (UIView*) countView{
    if (!_countView) {
        _countView = [[UIView alloc] init];
        [self.statisticsView addSubview:_countView];
    }
    return _countView;
}

- (UILabel*) countTitleLabel{
    if (!_countTitleLabel) {
        _countTitleLabel = [self.countView addLabel];
        _countTitleLabel.font = [UIFont systemFontOfSize:14];
        _countTitleLabel.textColor = [UIColor commonTextColor];
        _countTitleLabel.text = @"记录";
    }
    return _countTitleLabel;
}

- (UILabel*) countLabel{
    if (!_countLabel) {
        _countLabel = [self.countView addLabel];
        _countLabel.font = [UIFont systemFontOfSize:14];
        _countLabel.textColor = [UIColor commonTextColor];
        _countLabel.text = @"0";
    }
    return _countLabel;
}

- (UIView*) scoreView{
    if (!_scoreView) {
        _scoreView = [[UIView alloc] init];
        [self.statisticsView addSubview:_scoreView];
    }
    return _scoreView;
}

- (UILabel*) scoreTitleLabel{
    if (!_scoreTitleLabel) {
        _scoreTitleLabel = [self.scoreView addLabel];
        _scoreTitleLabel.font = [UIFont systemFontOfSize:14];
        _scoreTitleLabel.textColor = [UIColor commonTextColor];
        _scoreTitleLabel.text = @"得分";
    }
    return _scoreTitleLabel;
}

- (UILabel*) scoreLabel{
    if (!_scoreLabel) {
        _scoreLabel = [self.scoreView addLabel];
        _scoreLabel.font = [UIFont systemFontOfSize:14];
        _scoreLabel.textColor = [UIColor commonTextColor];
        _scoreLabel.text = @"0";
    }
    return _scoreLabel;
}

- (void) setTitle:(NSString*) title{
    self.titleLabel.text = title;
}

- (void) setStatistcsModel:(StatisticsModel*) model{
    if (!model) {
        self.countLabel.text = @"0";
        self.scoreLabel.text = @"0";
    }
    self.countLabel.text = [NSString stringWithFormat:@"%ld", model.count];
    self.scoreLabel.text = [NSString stringWithFormat:@"%.2f", model.score];
}
@end
