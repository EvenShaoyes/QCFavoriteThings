//
//  QCMineViewController.m
//  Favorite Things
//
//  Created by Joe-c on 15/7/13.
//  Copyright (c) 2015年 Joe-c. All rights reserved.
//

#import "QCMineViewController.h"
#import "LSCSettingController.h"
#import "LSCSettingItem.h"
#import "LSCSettingGroup.h"
#import "LSCSettingCell.h"
#import "LSCSettingArrowItem.h"

@interface QCMineViewController ()

@end

@implementation QCMineViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"设置" style:UIBarButtonItemStyleDone target:self action:@selector(clickSettingItem)];
    
}


/** push到设置界面*/
- (void)clickSettingItem
{
    LSCSettingController *setting = [[LSCSettingController alloc] init];
    [self.navigationController pushViewController:setting animated:YES];

}


@end
