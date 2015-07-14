//
//  LSCSettingController.m
//  Netease
//
//  Created by ShengCheng on 15/6/2.
//  Copyright (c) 2015年 ShengCheng. All rights reserved.
//

#import "LSCBaseTableViewController.h"
#import "LSCSettingItem.h"
#import "LSCSettingGroup.h"
#import "LSCSettingCell.h"
#import "LSCSettingArrowItem.h"


@interface LSCBaseTableViewController ()

@end

@implementation LSCBaseTableViewController



- (void)viewDidLoad
{
    [super viewDidLoad] ;
    
}


- (NSMutableArray *)data
{
    if (_data == nil) {
        _data = [NSMutableArray array];
        
    }
    return _data;
}


- (instancetype)init
{
    return [super initWithStyle:UITableViewStyleGrouped];
}


- (instancetype)initWithStyle:(UITableViewStyle)style
{
    return [super initWithStyle:UITableViewStyleGrouped];
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.data.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    LSCSettingGroup *group = self.data[section];
    return group.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LSCSettingCell *cell = [LSCSettingCell cellWithTableView:tableView];
    LSCSettingGroup *group = self.data[indexPath.section];
    
    cell.item = group.items[indexPath.row];

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    LSCSettingGroup *group = self.data[indexPath.section];
    LSCSettingItem *item = group.items[indexPath.row];
    
    if (item.option) {
        item.option();
    }else if ([item isKindOfClass:[LSCSettingArrowItem class]]) {
        LSCSettingArrowItem *arrowItem = (LSCSettingArrowItem *)item;

        // 如果没有跳转的控制器直接返回
        if (arrowItem.destVcClass == nil) return;
        
        UIViewController *vc = [[arrowItem.destVcClass alloc]init];

        vc.title = arrowItem.title;
        [self.navigationController pushViewController:vc animated:YES];
    }
    
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    LSCSettingGroup *group = self.data[section];
    return group.header;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    LSCSettingGroup *group = self.data[section];
    return group.footer;
}
@end
