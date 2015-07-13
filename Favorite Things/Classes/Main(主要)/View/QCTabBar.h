//
//  QCTabBar.h
//  Favorite Things
//
//  Created by Joe-c on 15/7/13.
//  Copyright (c) 2015年 Joe-c. All rights reserved.
//

#import <UIKit/UIKit.h>

@class QCTabBar;

@protocol QCTabBarDelegate <NSObject>

- (void)tabBarClickPlusBtn:(QCTabBar *)tabBar;

@end

@interface QCTabBar : UITabBar

@property(nonatomic,weak)id<QCTabBarDelegate> delegate;

@end