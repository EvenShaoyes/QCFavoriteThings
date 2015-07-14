//
//  LSCSettingGroup.h
//  Favorite Things
//
//  Created by ShengCheng on 15/6/2.
//  Copyright (c) 2015年 ShengCheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LSCSettingGroup : NSObject
/**
 *  头部标题
 */
@property (nonatomic, copy) NSString *header;
/**
 *  尾部标题
 */
@property (nonatomic, copy) NSString *footer;
/**
 *  存放着这组所有行的模型数据（这个数组都是settingItem对象）
 */
@property (nonatomic, strong) NSArray *items;

@end
