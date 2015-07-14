//
//  QCNavigationController.m
//  Favorite Things
//
//  Created by Joe-c on 15/7/14.
//  Copyright (c) 2015年 Joe-c. All rights reserved.
//

#import "QCNavigationController.h"

@implementation QCNavigationController




- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    if (self.childViewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    [super pushViewController:viewController animated:YES];
}
@end
