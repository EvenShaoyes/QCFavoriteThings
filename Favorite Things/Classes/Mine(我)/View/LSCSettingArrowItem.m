//
//  LSCSettingArrowItem.m
//  Favorite Things
//
//  Created by ShengCheng on 15/6/3.
//  Copyright (c) 2015年 ShengCheng. All rights reserved.
//

#import "LSCSettingArrowItem.h"

@implementation LSCSettingArrowItem

+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title destVcClass:(Class)destVcClass
{
    LSCSettingArrowItem *item = [self itemWithIcon:icon title:title];
    item.destVcClass = destVcClass;
    return item;
}

+ (instancetype)itemWithTitle:(NSString *)title destVcClass:(Class)destVcClass
{
    return [self itemWithIcon:nil title:title destVcClass:destVcClass];
}
@end
