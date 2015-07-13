//
//  QCProductCell.h
//  Favorite Things
//
//  Created by Joe-c on 15/7/13.
//  Copyright (c) 2015年 Joe-c. All rights reserved.
//

#import <UIKit/UIKit.h>
@class QCProduct;

@interface QCProductCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView;
@property(nonatomic,strong)QCProduct *product;

@end
