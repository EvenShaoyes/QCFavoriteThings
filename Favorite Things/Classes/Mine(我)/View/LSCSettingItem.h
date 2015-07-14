//
//  LSCSettingItem.h
//  Favorite Things
//
//  Created by ShengCheng on 15/6/2.
//  Copyright (c) 2015年 ShengCheng. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void(^SettingCellItemOption)();

@interface LSCSettingItem : NSObject
/**
 *  图标
 */
@property (nonatomic, copy) NSString *icon;
/**
 *  标题
 */
@property (nonatomic, copy) NSString *title;
/**
 *  标题
 */
@property (nonatomic, copy) NSString *subTitle;
/**
 *  用来判断title是否相同是使用
 */
@property (nonatomic, copy) NSString *key;

/**
 *  使用block
 */
@property (nonatomic, copy) SettingCellItemOption option;

+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title;
+ (instancetype)itemWithTitle:(NSString *)title;
+ (instancetype)itemWithTitle:(NSString *)title subTitle:(NSString *)subTitle;
@end
