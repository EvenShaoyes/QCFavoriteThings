//
//  QCUploadUser.h
//  Favorite Things
//
//  Created by Joe-c on 15/7/13.
//  Copyright (c) 2015年 Joe-c. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QCUploadUser : NSObject
/**
 *  用户ID
 */
@property (nonatomic, assign) double uploadUserIdentifier;
/**
 *  注册时间
 */
@property (nonatomic, strong) NSString *regTime;
/**
 *  性别
 */
@property (nonatomic, assign) BOOL sex;
/**
 *  计数
 */
@property (nonatomic, assign) double followeeCount;
/**
 *  省
 */
@property (nonatomic, strong) NSString *province;
/**
 *  头像url
 */
@property (nonatomic, strong) NSString *avatarUrl;
/**
 *  喜欢数
 */
@property (nonatomic, assign) double likeCount;
/**
 *  关注数量
 */
@property (nonatomic, assign) double followerCount;
/**
 *  上传授权
 */
@property (nonatomic, assign) BOOL uploadAuthorized;
/**
 *  城市
 */
@property (nonatomic, strong) NSString *city;
/**
 *  用户名称
 */
@property (nonatomic, strong) NSString *username;
/**
 *  最后登录时间
 */
@property (nonatomic, strong) NSString *lastLoginTime;
/**
 *  国家
 */
@property (nonatomic, strong) NSString *country;
@end
