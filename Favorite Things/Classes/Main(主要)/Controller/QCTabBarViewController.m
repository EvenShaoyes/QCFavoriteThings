//
//  QCTabBarViewController.m
//  Favorite Things
//
//  Created by Joe-c on 15/7/13.
//  Copyright (c) 2015年 Joe-c. All rights reserved.
//

#import "QCTabBarViewController.h"
#import "QCDiscoverViewController.h"
#import "QCCategoryViewController.h"
#import "QCUploadViewController.h"
#import "QCNotificationViewController.h"
#import "QCMineViewController.h"
#import "QCTabBar.h"

@interface QCTabBarViewController () <QCTabBarDelegate>

@end

@implementation QCTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    QCDiscoverViewController *discoverVC = [[QCDiscoverViewController alloc] init];
    [self addChildViewController:discoverVC title:@"发现" image:@"Discover-off" highImage:@"Discover-on"];
    
    QCCategoryViewController *categoryVC = [[QCCategoryViewController alloc] init];
    [self addChildViewController:categoryVC title:@"分类" image:@"Category-off" highImage:@"Category-on"];
    
    QCNotificationViewController *notificationVC = [[QCNotificationViewController alloc] init];
    [self addChildViewController:notificationVC title:@"消息" image:@"Notification-off" highImage:@"Notification-on"];
    
    QCMineViewController *mineVC = [[QCMineViewController alloc] init];
    [self addChildViewController:mineVC title:@"我" image:@"MyAccount-off" highImage:@"MyAccount-on"];
    
    QCTabBar *tabBar = [[QCTabBar alloc] init];
    tabBar.delegate = self;
    [self setValue:tabBar forKeyPath:@"tabBar"];
}


- (void)tabBarClickPlusBtn:(QCTabBar *)tabBar{
    
    QCUploadViewController *upload = [[QCUploadViewController alloc]init];
    [self presentViewController:upload animated:YES completion:nil];
    
}

- (void)addChildViewController:(UIViewController *)childController title:(NSString *)title image:(NSString *)image highImage:(NSString *)highImage{
    childController.tabBarItem.image = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childController.tabBarItem.selectedImage = [[UIImage imageNamed:highImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    childController.title = title;
    
    NSMutableDictionary *attri = [NSMutableDictionary dictionary];
    attri[NSForegroundColorAttributeName] = [UIColor grayColor];
    [childController.tabBarItem setTitleTextAttributes:attri forState:UIControlStateNormal];
    
    UINavigationController *navVC = [[UINavigationController alloc] initWithRootViewController:childController];
    [self addChildViewController:navVC];
}

@end
