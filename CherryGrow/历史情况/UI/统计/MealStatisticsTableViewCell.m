//
//  MealStatisticsTableViewCell.m
//  CherryGrow
//
//  Created by YinQ on 2018/12/18.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import "MealStatisticsTableViewCell.h"
#import "MealStatisticsDetModel.h"

@interface MealStatisticsTableViewCell()

@property (nonatomic, strong) UIView* monthView;
@property (nonatomic, strong) UILabel* monthLabel;
@property (nonatomic, strong) UILabel* staticsLabel;

@property (nonatomic, strong) UILabel* speedLabel;
@property (nonatomic, strong) UILabel* feedLabel;
@property (nonatomic, strong) UILabel* amountLabel;

@end

@implementation MealStatisticsTableViewCell

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
        [self layoutElements];
    }
    return self;
}

- (void) layoutElements{
    [self.monthView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self.contentView);
        make.height.mas_equalTo(@39);
    }];
    
    [self.monthLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.monthView);
        make.left.equalTo(self.monthView).offset(13);
    }];
    
    [self.staticsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.monthView);
        make.right.equalTo(self.monthView).offset(-13);
    }];
    
    [self.speedLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.monthView.mas_bottom).offset(12);
        make.left.equalTo(self.contentView).offset(13);
        
    }];
    
    [self.feedLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.speedLabel.mas_bottom).offset(12);
        make.left.equalTo(self.contentView).offset(13);
    }];
    
    [self.amountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.feedLabel.mas_bottom).offset(12);
        make.left.equalTo(self.contentView).offset(13);
        make.bottom.equalTo(self.contentView).offset(-12);
    }];
}



#pragma mark - settingAndGetting
- (UIView*) monthView{
    if (!_monthView) {
        _monthView = [[UIView alloc] init];
        [self.contentView addSubview:_monthView];
        _monthView.backgroundColor = [UIColor commonBackgroundColor];
        [_monthView showBoarder:UIViewBorderLineTypeBottom];
    }
    return _monthView;
}

- (UILabel*) monthLabel{
    if (!_monthLabel) {
        _monthLabel = [self.monthView addLabel];
        _monthLabel.font = [UIFont systemFontOfSize:13];
        _monthLabel.textColor = [UIColor mainThemeColor];
    }
    return _monthLabel;
}

- (UILabel*) staticsLabel{
    if (!_staticsLabel) {
        _staticsLabel = [self.monthView addLabel];
        _staticsLabel.font = [UIFont systemFontOfSize:13];
        _staticsLabel.textColor = [UIColor commonTextColor];
    }
    return _staticsLabel;
}

- (UILabel*) speedLabel{
    if (!_speedLabel) {
        _speedLabel = [self.monthView addLabel];
        _speedLabel.font = [UIFont systemFontOfSize:14];
        _speedLabel.textColor = [UIColor commonTextColor];
    }
    return _speedLabel;
}

- (UILabel*) feedLabel{
    if (!_feedLabel) {
        _feedLabel = [self.monthView addLabel];
        _feedLabel.font = [UIFont systemFontOfSize:14];
        _feedLabel.textColor = [UIColor commonTextColor];
    }
    return _feedLabel;
}

- (UILabel*) amountLabel{
    if (!_amountLabel) {
        _amountLabel = [self.monthView addLabel];
        _amountLabel.font = [UIFont systemFontOfSize:14];
        _amountLabel.textColor = [UIColor commonTextColor];
    }
    return _amountLabel;
}

- (void) setMealStatisticsDetModel:(MealStatisticsDetModel*) detModel{
    self.monthLabel.text = detModel.month;
    
    NSString* countString = [NSString stringWithFormat:@" %ld", detModel.count];
    NSString* scoreString = [NSString stringWithFormat:@" %.2f", detModel.score];
    NSString* statisticsString = [NSString stringWithFormat:@"记录: %@   得分: %@", countString, scoreString];
    NSRange countRange = [statisticsString rangeOfString:countString];
    NSRange scoreRange = [statisticsString rangeOfString:scoreString];
    NSMutableAttributedString* attrString = [[NSMutableAttributedString alloc] initWithString:statisticsString];
    [attrString addAttribute:NSForegroundColorAttributeName value:[UIColor mainThemeColor] range:countRange];
    [attrString addAttribute:NSForegroundColorAttributeName value:[UIColor mainThemeColor] range:scoreRange];
    
    self.staticsLabel.attributedText = attrString;
    
    NSString* speedFastStr = [NSString stringWithFormat:@"%ld", detModel.speedFast];
    NSString* speedNormalStr = [NSString stringWithFormat:@"%ld", detModel.speedNormal];
    NSString* speedSlowStr = [NSString stringWithFormat:@"%ld", detModel.speedSlow];
    NSString* speedString = [NSString stringWithFormat:@"速度：  吃得快 "];
    
    NSRange speedFastRange = NSMakeRange(speedString.length, speedFastStr.length);
    speedString = [speedString stringByAppendingString:speedFastStr];
    
    speedString = [speedString stringByAppendingString:@" 较慢 "];
    NSRange speedNormalRange = NSMakeRange(speedString.length, speedNormalStr.length);
    speedString = [speedString stringByAppendingString:speedNormalStr];
    
    speedString = [speedString stringByAppendingString:@" 很慢 "];
    NSRange speedSlowRange = NSMakeRange(speedString.length, speedSlowStr.length);
    speedString = [speedString stringByAppendingString:speedSlowStr];
    
    NSMutableAttributedString* speedAttrString = [[NSMutableAttributedString alloc] initWithString:speedString];
    [speedAttrString addAttribute:NSForegroundColorAttributeName value:[UIColor mainThemeColor] range:speedFastRange];
    [speedAttrString addAttribute:NSForegroundColorAttributeName value:[UIColor mainThemeColor] range:speedNormalRange];
    [speedAttrString addAttribute:NSForegroundColorAttributeName value:[UIColor mainThemeColor] range:speedSlowRange];
    self.speedLabel.attributedText = speedAttrString;
    
    NSString* feedGoodStr = [NSString stringWithFormat:@"%ld", detModel.feedGood];
    NSString* feedNormalStr = [NSString stringWithFormat:@"%ld", detModel.feedNormal];
    NSString* feedLowStr = [NSString stringWithFormat:@"%ld", detModel.feedLow];
    NSString* feedString = [NSString stringWithFormat:@"喂饭：  自己吃 "];
    
    NSRange feedGoodRange = NSMakeRange(feedString.length, feedGoodStr.length);
    feedString = [feedString stringByAppendingString:feedGoodStr];
    
    feedString = [feedString stringByAppendingString:@" 喂部分 "];
    NSRange feedNormalRange = NSMakeRange(feedString.length, feedNormalStr.length);
    feedString = [feedString stringByAppendingString:feedNormalStr];
    
    feedString = [feedString stringByAppendingString:@" 全部喂 "];
    NSRange feedLowRange = NSMakeRange(feedString.length, feedLowStr.length);
    feedString = [feedString stringByAppendingString:feedLowStr];
    
    NSMutableAttributedString* feedAttrString = [[NSMutableAttributedString alloc] initWithString:feedString];
    [feedAttrString addAttribute:NSForegroundColorAttributeName value:[UIColor mainThemeColor] range:feedGoodRange];
    [feedAttrString addAttribute:NSForegroundColorAttributeName value:[UIColor mainThemeColor] range:feedNormalRange];
    [feedAttrString addAttribute:NSForegroundColorAttributeName value:[UIColor mainThemeColor] range:feedLowRange];
    self.feedLabel.attributedText = feedAttrString;
    
    
    NSString* amountGoodStr = [NSString stringWithFormat:@"%ld", detModel.amountMuch];
    NSString* amountNormalStr = [NSString stringWithFormat:@"%ld", detModel.amountNormal];
    NSString* amountLowStr = [NSString stringWithFormat:@"%ld", detModel.amountFew];
    NSString* amountString = [NSString stringWithFormat:@"饭量：  较多 "];
    
    NSRange amountGoodRange = NSMakeRange(amountString.length, amountGoodStr.length);
    amountString = [amountString stringByAppendingString:amountGoodStr];
    
    amountString = [amountString stringByAppendingString:@" 较少 "];
    NSRange amountNormalRange = NSMakeRange(amountString.length, amountNormalStr.length);
    amountString = [amountString stringByAppendingString:amountNormalStr];
    
    amountString = [amountString stringByAppendingString:@" 很少 "];
    NSRange amountLowRange = NSMakeRange(amountString.length, amountLowStr.length);
    amountString = [amountString stringByAppendingString:amountLowStr];
    
    NSMutableAttributedString* amountAttrString = [[NSMutableAttributedString alloc] initWithString:amountString];
    [amountAttrString addAttribute:NSForegroundColorAttributeName value:[UIColor mainThemeColor] range:amountGoodRange];
    [amountAttrString addAttribute:NSForegroundColorAttributeName value:[UIColor mainThemeColor] range:amountNormalRange];
    [amountAttrString addAttribute:NSForegroundColorAttributeName value:[UIColor mainThemeColor] range:amountLowRange];
    self.amountLabel.attributedText = amountAttrString;
}

@end
