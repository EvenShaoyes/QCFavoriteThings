//
//  LSCSettingCell.h
//  Favorite Things
//
//  Created by ShengCheng on 15/6/3.
//  Copyright (c) 2015年 ShengCheng. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LSCSettingItem;
@interface LSCSettingCell : UITableViewCell
@property (nonatomic, strong) LSCSettingItem *item;
+(instancetype)cellWithTableView:(UITableView *)tableView;
@property (nonatomic, assign, getter = isLastRowInSection) BOOL lastRowInSection;
@end
