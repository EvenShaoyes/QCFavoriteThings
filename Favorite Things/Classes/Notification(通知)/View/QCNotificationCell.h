//
//  QCNotificationCell.h
//  Favorite Things
//
//  Created by Joe-c on 15/7/16.
//  Copyright (c) 2015年 Joe-c. All rights reserved.
//

#import <UIKit/UIKit.h>
@class QCNotificaton;
@interface QCNotificationCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView;
@property(nonatomic,strong)QCNotificaton *noti;

@end
