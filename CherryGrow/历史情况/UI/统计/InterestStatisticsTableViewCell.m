//
//  InterestStatisticsTableViewCell.m
//  CherryGrow
//
//  Created by YinQ on 2018/12/19.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import "InterestStatisticsTableViewCell.h"

@interface InterestStatisticsTableViewCell ()

@property (nonatomic, strong) UIView* detView;
@property (nonatomic, strong) UILabel* cateNameLabel;
@property (nonatomic, strong) UILabel* statisticLabel;

@end

@implementation InterestStatisticsTableViewCell

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
        self.contentView.backgroundColor = [UIColor commonBackgroundColor];
        [self layoutElements];
    }
    return self;
}

- (void) layoutElements{
    [self.detView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView).insets(UIEdgeInsetsMake(7, 13, 7, 13));
    }];
    
    [self.cateNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.detView).offset(12);
        make.top.equalTo(self.detView).offset(10);
    }];
    
    [self.statisticLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.detView).offset(12);
        make.top.equalTo(self.cateNameLabel.mas_bottom).offset(13);
        make.bottom.equalTo(self.detView).offset(-10);
    }];
}

#pragma mark - settingAndGetting

- (UIView*) detView{
    if (!_detView) {
        _detView = [[UIView alloc] init];
        [self.contentView addSubview:_detView];
        _detView.backgroundColor = [UIColor whiteColor];
        [_detView setCornerRadius:5];
    }
    return _detView;
}

- (UILabel*) cateNameLabel{
    if (!_cateNameLabel) {
        _cateNameLabel = [self.detView addLabel];
        _cateNameLabel.textColor = [UIColor commonTextColor];
        _cateNameLabel.font = [UIFont systemFontOfSize:13];
    }
    return _cateNameLabel;
}

- (UILabel*) statisticLabel{
    if (!_statisticLabel) {
        _statisticLabel = [self.detView addLabel];
        _statisticLabel.textColor = [UIColor commonTextColor];
        _statisticLabel.font = [UIFont systemFontOfSize:14];
    }
    return _statisticLabel;
}

- (void) setInterestStatisticsItem:(InterestStatisticsItemModel*) itemModel{
    self.cateNameLabel.text = itemModel.cateName;
    
    NSString* goodStr = [NSString stringWithFormat:@"%ld", itemModel.goodCount];
    NSString* normalStr = [NSString stringWithFormat:@"%ld", itemModel.normalCount];
    NSString* lowStr = [NSString stringWithFormat:@"%ld", itemModel.lowCount];
    NSString* statisticsStr = [NSString stringWithFormat:@"表现优秀: "];
    
    NSRange goodRange = NSMakeRange(statisticsStr.length, goodStr.length);
    statisticsStr = [statisticsStr stringByAppendingString:goodStr];
    
    statisticsStr = [statisticsStr stringByAppendingString:@" 表现一般: "];
    NSRange normalRange = NSMakeRange(statisticsStr.length, normalStr.length);
    statisticsStr = [statisticsStr stringByAppendingString:normalStr];
    
    statisticsStr = [statisticsStr stringByAppendingString:@" 表现较差: "];
    NSRange lowRange = NSMakeRange(statisticsStr.length, lowStr.length);
    statisticsStr = [statisticsStr stringByAppendingString:lowStr];
    
    NSMutableAttributedString* attrString = [[NSMutableAttributedString alloc] initWithString:statisticsStr];
    [attrString addAttribute:NSForegroundColorAttributeName value:[UIColor mainThemeColor] range:goodRange];
    [attrString addAttribute:NSForegroundColorAttributeName value:[UIColor mainThemeColor] range:normalRange];
    [attrString addAttribute:NSForegroundColorAttributeName value:[UIColor mainThemeColor] range:lowRange];
    self.statisticLabel.attributedText = attrString;
}
@end
