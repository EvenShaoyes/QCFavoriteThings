//
//  LSCHeadView.m
//  Favorite Things
//
//  Created by 兜麦 on 15/7/15.
//  Copyright (c) 2015年 Joe-c. All rights reserved.
//

#import "LSCHeadView.h"
#import "UIView+Extend.h"
#import "LSCMineToolBar.h"

#define LSCHEADVIEWFONT [UIFont systemFontOfSize:14]
#define LSCPADDING 10

@interface LSCHeadView ()
/** 用户头像 */
@property (nonatomic, strong) UIImageView *userImageView;

/** 用户昵称 */
@property (nonatomic, strong) UILabel *userName;

/** 粉丝 */
@property (nonatomic, strong) UILabel *fans;

/** 关注 */
@property (nonatomic, strong) UILabel *attention;

/** 被赞 */
@property (nonatomic, strong) UILabel *approval;

/** 收藏产品工具条  晒好物  喜欢  拥有 */
@property (nonatomic, strong) LSCMineToolBar *mineToolBar;

@end


@implementation LSCHeadView

- (void)viewDidLoad
{
    [super viewDidLoad];
    /** 初始化子控件 */
    [self setupSubViewsFrame];
}


    /** 初始化子控件 */
- (void)setupSubViewsFrame
{
    
    /** 用户头像 */
    CGFloat iconY = 80;
    CGFloat iconX = 160;
    CGFloat iconW = 50;
    CGFloat iconH = 50;
    self.userImageView.frame = CGRectMake(iconX, iconY, iconW, iconH);
    
    /** 用户昵称 */
    CGFloat nameY = self.userImageView.maxY + LSCPADDING;
    CGFloat nameX = 145;
    CGFloat nameW = 80;
    CGFloat nameH = 30;
    self.userName.frame = CGRectMake(nameX, nameY, nameW, nameH);
    
    /** 粉丝 */
    CGFloat fansX = 40;
    CGFloat fansY = self.userName.maxY + 20;
    CGFloat fansW = 80;
    CGFloat fansH = 30;
    self.fans.frame = CGRectMake(fansX, fansY, fansW, fansH);
    
    /** 关注 */
    CGFloat attentionX = self.fans.maxX + 25;
    CGFloat attentionY = fansY;
    CGFloat attentionW = fansW;
    CGFloat attentionH = fansH;
    self.attention.frame = CGRectMake(attentionX, attentionY, attentionW, attentionH);
    
    /** 被赞 */
    CGFloat approvalX = self.attention.maxX + 25;
    CGFloat approvalY = attentionY;
    CGFloat approvalW = attentionW;
    CGFloat approvalH = attentionH;
    self.approval.frame = CGRectMake(approvalX, approvalY, approvalW, approvalH);
    
    /** 收藏产品工具条  晒好物  喜欢  拥有 */
    CGFloat mineToolBarX = 0;
    CGFloat mineToolBarY = self.approval.maxY + 35;
    CGFloat mineToolBarW = self.view.width;
    CGFloat mineToolBarH = 40;
    self.mineToolBar.frame = CGRectMake(mineToolBarX, mineToolBarY, mineToolBarW, mineToolBarH);
    
}


    /** 用户头像 */
- (UIImageView *)userImageView
{
    if (!_userImageView)
    {
        _userImageView = [[UIImageView alloc] init];
        self.userImageView.backgroundColor = [UIColor redColor];
        self.userImageView.image = [UIImage imageNamed:@"MyAccount-off"];
        [self.view addSubview:self.userImageView];
    }
    return _userImageView;
}


    /** 用户昵称 */
- (UILabel *)userName
{
    if (!_userName)
    {
        _userName = [[UILabel alloc] init];
        self.userName.font = LSCHEADVIEWFONT;
        self.userName.backgroundColor = [UIColor redColor];
        self.userName.text = @"昵称";
        [self.userName setTextAlignment:NSTextAlignmentCenter];
        [self.view addSubview:self.userName];
    }
    return _userName;
}


    /** 粉丝 */
- (UILabel *)fans
{
    if (!_fans)
    {
        _fans = [[UILabel alloc] init];
        self.fans.font = LSCHEADVIEWFONT;
        self.fans.backgroundColor = [UIColor redColor];
        self.fans.text = @"3 粉丝";
        [self.fans setTextAlignment:NSTextAlignmentCenter];
        [self.view addSubview:self.fans];
    }
    return _fans;
}

    /** 关注 */
- (UILabel *)attention
{
    if (!_attention)
    {
        _attention = [[UILabel alloc] init];
        self.attention.font = LSCHEADVIEWFONT;
        self.attention.backgroundColor = [UIColor redColor];
        self.attention.text = @"3 关注";
        [self.attention setTextAlignment:NSTextAlignmentCenter];
        [self.view addSubview:self.attention];
    }
    return _attention;
}


    /** 被赞 */
- (UILabel *)approval
{
    if (!_approval)
    {
        _approval = [[UILabel alloc] init];
        self.approval.font = LSCHEADVIEWFONT;
        self.approval.backgroundColor = [UIColor redColor];
        self.approval.text = @"3 被赞";
        [self.approval setTextAlignment:NSTextAlignmentCenter];
        [self.view addSubview:self.approval];
    }
    return _approval;
}

    /** 收藏产品工具条  晒好物  喜欢  拥有 */
- (LSCMineToolBar *)mineToolBar
{
    if (!_mineToolBar)
    {
        _mineToolBar = [[LSCMineToolBar alloc] init];
        self.mineToolBar.backgroundColor = [UIColor greenColor];
        [self.view addSubview:self.mineToolBar];
    }
    return _mineToolBar;
}





@end
