//
//  QCProduct.h
//  Favorite Things
//
//  Created by Joe-c on 15/7/13.
//  Copyright (c) 2015年 Joe-c. All rights reserved.
//

#import <Foundation/Foundation.h>

@class QCUploadUser;

@interface QCProduct : NSObject
/**
 *  ID
 */
@property (nonatomic, assign) double internalBaseClassIdentifier;
/**
 *  分类
 */
@property (nonatomic, strong) NSArray *categories;
/**
 *  产品简介
 */
@property (nonatomic, strong) NSString *briefDesc;
/**
 *  上传用户
 */
@property (nonatomic, strong) QCUploadUser *uploadUser;
/**
 *  拥有数
 */
@property (nonatomic, assign) double wantCount;

@property (nonatomic, assign) BOOL reported;
/**
 *  产品图片url
 */
@property (nonatomic, strong) NSString *imageUrl;

/**
 *  喜欢的个数
 */
@property (nonatomic, assign) double likeCount;

/**
 *  拥有
 */
@property (nonatomic, assign) BOOL wanted;

/**
 *  创建时间
 */
@property (nonatomic, strong) NSString *createTime;
/**
 *  评论计数
 */
@property (nonatomic, assign) double commentCount;
/**
 *  分享url
 */
@property (nonatomic, strong) NSString *shareUrl;

/**
 *  喜欢
 */
@property (nonatomic, assign) BOOL liked;

/**
 *  产品标题
 */
@property (nonatomic, strong) NSString *name;
/**
 *  关注
 */
@property (nonatomic, assign) BOOL follow;

@end
