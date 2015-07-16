//
//  QCNotificaton.h
//  Favorite Things
//
//  Created by Joe-c on 15/7/16.
//  Copyright (c) 2015年 Joe-c. All rights reserved.
//  消息控制器中cell的模型 ,  命名不规范不要打我,  !!!

#import <Foundation/Foundation.h>

@interface QCNotificaton : NSObject

@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *icon;

- (instancetype)initWithTitle:(NSString *)title icon:(NSString *)icon;

@end
