//
//  QCMineViewController.m
//  Favorite Things
//
//  Created by Joe-c on 15/7/13.
//  Copyright (c) 2015年 Joe-c. All rights reserved.
//

#import "QCMineViewController.h"
#import "LSCSettingController.h"
@interface QCMineViewController ()

@end

@implementation QCMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"设置" style:UIBarButtonItemStyleDone target:self action:@selector(clickSettingItem)];
}

- (void)clickSettingItem
{
    LSCSettingController *setting = [[LSCSettingController alloc] init];
    [self.navigationController pushViewController:setting animated:YES];
}
@end
