//
//  TagView.h
//  YYCommon
//
//  Created by YinQ on 2018/8/8.
//

#import <UIKit/UIKit.h>

@interface TagView : UIView

@property (nonatomic, assign) NSInteger selectIndex;
@property (nonatomic, strong) UIColor* selectTagColor;

- (void) createTagCells:(NSArray<NSString*>*) titles;

@end
