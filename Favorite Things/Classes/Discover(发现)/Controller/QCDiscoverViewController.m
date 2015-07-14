//
//  QCDiscoverViewController.m
//  Favorite Things
//
//  Created by Joe-c on 15/7/13.
//  Copyright (c) 2015年 Joe-c. All rights reserved.
//

#import "QCDiscoverViewController.h"
#import "QCProductCell.h"
#import "MJExtension.h"
#import "QCDataModels.h"
#import "AFNetworking.h"
@interface QCDiscoverViewController ()

@property(nonatomic,strong)NSArray *productList;


@end

@implementation QCDiscoverViewController

- (NSArray *)productList{
    if (!_productList) {
        _productList = [QCProduct objectArrayWithFilename:@"product.plist"];
    }
    return _productList;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    [manager GET:@"http://182.92.26.196:8080/wanyi/api/product/" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        self.productList = [QCProduct objectArrayWithKeyValuesArray:responseObject];
//    
//        self.productList = [[self.productList reverseObjectEnumerator] allObjects];
//        
//        [self.tableView reloadData];
//        
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        
//    }];

    self.tableView.rowHeight = 480;
    
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    QCProductCell *cell = [QCProductCell cellWithTableView:tableView];
    cell.product = self.productList[indexPath.row];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
}


@end
