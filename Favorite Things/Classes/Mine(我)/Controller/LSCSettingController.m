//
//  LSCSettingController.m
//  Favorite Things
//
//  Created by ShengCheng on 15/6/2.
//  Copyright (c) 2015年 ShengCheng. All rights reserved.
//

#import "LSCSettingController.h"
#import "LSCSettingItem.h"
#import "LSCSettingGroup.h"
#import "LSCSettingCell.h"
#import "LSCSettingArrowItem.h"
#import "LSCVersionsController.h"
#import "LSCAboutController.h"
#import "LSCServiceController.h"

@interface LSCSettingController ()

@end

@implementation LSCSettingController

- (void)viewDidLoad
{
    [super viewDidLoad];

    /**版本信息*/
    [self setupVersionsData];
    
    /**关于我们*/
    [self setupAboutData];
    
     /**服务条款及隐私政策*/
    [self setupServiceData];
}

    /**版本信息*/
- (void)setupVersionsData
{
    LSCSettingItem *versions = [LSCSettingArrowItem itemWithTitle:@"版本信息"
                                destVcClass:[LSCVersionsController class]];
    
    LSCSettingGroup *groupZero = [[LSCSettingGroup alloc] init];
    groupZero.items = @[versions];
    [self.data addObject:groupZero];
    
}

    /**关于我们*/
- (void)setupAboutData
{
    LSCSettingItem *about = [LSCSettingArrowItem itemWithTitle:@"关于我们"
                                destVcClass:[LSCAboutController class]];
    
    LSCSettingGroup *groupOne = [[LSCSettingGroup alloc] init];
    groupOne.items = @[about];
    [self.data addObject:groupOne];
    
}

    /**服务条款及隐私政策*/
- (void)setupServiceData
{
    LSCSettingItem *service = [LSCSettingArrowItem itemWithTitle:@"服务条款及隐私政策"
                              destVcClass:[LSCServiceController class]];
    
    LSCSettingGroup *groupTwo = [[LSCSettingGroup alloc] init];
    groupTwo.items = @[service];
    [self.data addObject:groupTwo];
    
}


@end
