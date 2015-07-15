//
//  QCCategory.h
//  Favorite Things
//
//  Created by Joe-c on 15/7/15.
//  Copyright (c) 2015年 Joe-c. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QCCategory : NSObject

@property (nonatomic, assign) double internalBaseClassIdentifier;

/**
 *  分类名称
 */
@property (nonatomic, strong) NSString *name;

/**
 *  分类描述
 */
@property (nonatomic, strong) NSString *desc;

/**
 *  分类产品的个数
 */
@property (nonatomic, assign) double productCount;
@end
