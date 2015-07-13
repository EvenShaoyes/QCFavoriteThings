//
//  QCCategories.h
//  Favorite Things
//
//  Created by Joe-c on 15/7/13.
//  Copyright (c) 2015年 Joe-c. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QCCategories : NSObject
/**
 *  ID标识
 */
@property (nonatomic, assign) double categoriesIdentifier;
/**
 *  产品名称
 */
@property (nonatomic, strong) NSString *name;
/**
 *  产品描述
 */
@property (nonatomic, strong) NSString *desc;
/**
 *  产品数量
 */
@property (nonatomic, assign) double productCount;
@end
