//
//  QCNotificationViewController.m
//  Favorite Things
//
//  Created by Joe-c on 15/7/13.
//  Copyright (c) 2015年 Joe-c. All rights reserved.
//

#import "QCNotificationViewController.h"
#import "QCNotificaton.h"
#import "QCNotificationCell.h"

@interface QCNotificationViewController ()

@property(nonatomic,strong)NSArray *notificationList;


@end

@implementation QCNotificationViewController

/**
 *  初始化模型数据
 */
- (NSArray *)notificationList{
    if (!_notificationList) {
        QCNotificaton *newLike = [[QCNotificaton alloc] initWithTitle:@"新的喜欢" icon:@"New_like"];
        QCNotificaton *newWanted = [[QCNotificaton alloc] initWithTitle:@"新的拥有" icon:@"New_own"];
        QCNotificaton *newComment = [[QCNotificaton alloc] initWithTitle:@"新的评论" icon:@"New_comment"];
        QCNotificaton *newFans = [[QCNotificaton alloc] initWithTitle:@"新的粉丝" icon:@"New_follower"];
        _notificationList = [NSArray arrayWithObjects:newLike,newWanted,newComment,newFans, nil];
    }
    return _notificationList;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.rowHeight = 66;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];

}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.notificationList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    QCNotificationCell *cell = [QCNotificationCell cellWithTableView:tableView];
    cell.noti = self.notificationList[indexPath.row];
    return cell;
}

#pragma mark - 设置cell的分割线左右贴紧屏幕
-(void)viewDidLayoutSubviews
{
    if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.tableView setSeparatorInset:UIEdgeInsetsMake(0,0,0,0)];
    }
    
    if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [self.tableView setLayoutMargins:UIEdgeInsetsMake(0,0,0,0)];
    }
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}

@end
