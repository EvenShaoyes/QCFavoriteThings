//
//  QCCategoryCell.h
//  Favorite Things
//
//  Created by Joe-c on 15/7/15.
//  Copyright (c) 2015年 Joe-c. All rights reserved.
//

#import <UIKit/UIKit.h>
@class QCCategories;
@interface QCCategoryCell : UITableViewCell

@property(nonatomic,strong)QCCategories *category;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
