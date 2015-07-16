//
//  QCNotificaton.m
//  Favorite Things
//
//  Created by Joe-c on 15/7/16.
//  Copyright (c) 2015年 Joe-c. All rights reserved.
//

#import "QCNotificaton.h"

@implementation QCNotificaton

- (instancetype)initWithTitle:(NSString *)title icon:(NSString *)icon{
    if (self = [super init]) {
        self.title = title;
        self.icon = icon;
    }
    return self;
}

@end
