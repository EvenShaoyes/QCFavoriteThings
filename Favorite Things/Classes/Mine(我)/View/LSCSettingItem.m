//
//  LSCSettingItem.m
//  Favorite Things
//
//  Created by ShengCheng on 15/6/2.
//  Copyright (c) 2015年 ShengCheng. All rights reserved.
//

#import "LSCSettingItem.h"

@implementation LSCSettingItem

+(instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title
{
    LSCSettingItem *item = [[self alloc] init];
    item.icon = icon;
    item.title = title;
    return item;
}
+ (instancetype)itemWithTitle:(NSString *)title
{
    return [self itemWithIcon:nil title:title];
}
+ (instancetype)itemWithTitle:(NSString *)title subTitle:(NSString *)subTitle
{
    LSCSettingItem *item = [self itemWithTitle:title];
    item.subTitle = subTitle;
    return item;
}
@end
