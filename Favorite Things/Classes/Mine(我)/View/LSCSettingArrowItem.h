//
//  LSCSettingArrowItem.h
//  Favorite Things
//
//  Created by ShengCheng on 15/6/3.
//  Copyright (c) 2015年 ShengCheng. All rights reserved.
//

#import "LSCSettingItem.h"

@interface LSCSettingArrowItem : LSCSettingItem
/**
 *  点击这行cell需要跳转的控制器
 */
@property (nonatomic, assign) Class destVcClass;
/**
 *  便利方法
 */
+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title destVcClass:(Class)destVcClass;
+ (instancetype)itemWithTitle:(NSString *)title destVcClass:(Class)destVcClass;
@end
