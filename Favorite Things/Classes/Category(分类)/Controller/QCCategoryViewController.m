//
//  QCCategoryViewController.m
//  Favorite Things
//
//  Created by Joe-c on 15/7/13.
//  Copyright (c) 2015年 Joe-c. All rights reserved.
//

#import "QCCategoryViewController.h"
#import "AFNetworking.h"
#import "MJExtension.h"
#import "QCCategory.h"
#import "QCCategoryCell.h"


@interface QCCategoryViewController ()
@property(nonatomic,strong)NSArray *categoryList;

@end

@implementation QCCategoryViewController

- (NSArray *)categoryList{
    if (!_categoryList) {
        _categoryList = [NSArray array];
    }
    return _categoryList;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc] init];
    [manager GET:@"http://182.92.26.196:8080/wanyi/api/category" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        self.categoryList = [QCCategory objectArrayWithKeyValuesArray:responseObject];
        
        [self.tableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"请求失败 -- %@",error);
    }];

    self.tableView.rowHeight = 100;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

    
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.categoryList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    QCCategoryCell *cell = [QCCategoryCell cellWithTableView:tableView];
    cell.category = self.categoryList[indexPath.row];
    return cell;
}
@end
