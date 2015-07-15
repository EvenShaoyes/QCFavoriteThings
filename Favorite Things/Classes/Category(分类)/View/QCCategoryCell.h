//
//  QCCategoryCell.h
//  Favorite Things
//
//  Created by Joe-c on 15/7/15.
//  Copyright (c) 2015年 Joe-c. All rights reserved.
//

#import <UIKit/UIKit.h>
@class QCCategory;
@interface QCCategoryCell : UITableViewCell

@property(nonatomic,strong)QCCategory *category;

+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end
