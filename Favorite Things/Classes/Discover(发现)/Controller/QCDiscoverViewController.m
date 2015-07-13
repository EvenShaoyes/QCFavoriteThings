//
//  QCDiscoverViewController.m
//  Favorite Things
//
//  Created by Joe-c on 15/7/13.
//  Copyright (c) 2015年 Joe-c. All rights reserved.
//

#import "QCDiscoverViewController.h"
#import "QCProductCell.h"

@interface QCDiscoverViewController ()

@end

@implementation QCDiscoverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.rowHeight = 400;
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    QCProductCell *cell = [QCProductCell cellWithTableView:tableView];
    return cell;
}



@end
