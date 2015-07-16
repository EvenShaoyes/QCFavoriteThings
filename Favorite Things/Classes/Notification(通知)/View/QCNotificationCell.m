//
//  QCNotificationCell.m
//  Favorite Things
//
//  Created by Joe-c on 15/7/16.
//  Copyright (c) 2015年 Joe-c. All rights reserved.
//

#import "QCNotificationCell.h"
#import "QCNotificaton.h"

@interface QCNotificationCell ()
@property(nonatomic,strong)UIView *separateLine;

@end

@implementation QCNotificationCell
/**
 *  分割线
 */
- (UIView *)separateLine{
    if (!_separateLine) {
        _separateLine = [UIView new];
        _separateLine.backgroundColor = [UIColor colorWithWhite:0.000 alpha:0.260];
        [self addSubview:_separateLine];
    }
    return _separateLine;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    CGRect rect =  self.separateLine.frame;
    rect.origin.y =  65;
    rect.size.width = self.frame.size.width;
    rect.size.height = 1;
    rect.origin.x = 0;
    self.separateLine.frame = rect;

}

+ (instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *const ID = @"notification";
    QCNotificationCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[QCNotificationCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

- (void)setNoti:(QCNotificaton *)noti{
    _noti = noti;
    
    self.textLabel.text = noti.title;
    self.imageView.image = [UIImage imageNamed:noti.icon];
}
@end
