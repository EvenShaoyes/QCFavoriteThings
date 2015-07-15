//
//  LSCSettingCell.m
//  Favorite Things
//
//  Created by ShengCheng on 15/6/3.
//  Copyright (c) 2015年 ShengCheng. All rights reserved.
//

#import "LSCSettingCell.h"
#import "LSCSettingItem.h"
#import "LSCSettingArrowItem.h"

#define CellBg(r ,g ,b) [UIColor colorWithRed:(r)/ 255.0 green:(g)/ 255.0  blue:(b)/ 255.0  alpha:1.0]
@interface LSCSettingCell ()
@property (nonatomic, strong) UIImageView *arrowView;

@end


@implementation LSCSettingCell

    // 初始化cell时做些事
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        
    }
    return self;
}

- (void)setLastRowInSection:(BOOL)lastRowInSection
{
    _lastRowInSection = lastRowInSection;

}

    /**懒加载箭头*/
- (UIImageView *)arrowView
{
    if (_arrowView == nil) {
        _arrowView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"CellArrow"]];
    }
    return _arrowView;
}

- (void)setItem:(LSCSettingItem *)item
{
    _item = item;
    // 设置数据
    [self setupData];
    // 设置右边内容
    [self setupRightContent];
}

- (void)setupData
{
    
    if (self.item.icon.length)
    {
        self.imageView.image = [UIImage imageNamed:self.item.icon];
    }
    self.textLabel.text = self.item.title;
    self.detailTextLabel.text = self.item.subTitle;
}

- (void)setupRightContent
{
    if ([self.item isKindOfClass:[LSCSettingArrowItem class]]) {
        self.accessoryView = self.arrowView;
        /**循环应用可能会导致某行不能选中  需要设置为默认状态*/
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
    }else{
        /**解决cell循环运用问题*/
        self.accessoryView = nil;
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
    }
}

/**快速创建cell方法*/
+(instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"setting";
    LSCSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[LSCSettingCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                     reuseIdentifier:ID];
    }
    return cell;
}
@end
