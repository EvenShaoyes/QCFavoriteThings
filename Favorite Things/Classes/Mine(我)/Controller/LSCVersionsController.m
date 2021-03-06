//
//  LSCVersionsController.m
//  Favorite Things
//
//  Created by 兜麦 on 15/7/14.
//  Copyright (c) 2015年 Joe-c. All rights reserved.
//

#import "LSCVersionsController.h"
#import "UIView+Extend.h"
#import "NSString+extend.h"
#define LSCVERSIONFONT [UIFont systemFontOfSize:14]
#define LSCSCREENW [UIScreen mainScreen].bounds.size.width
#define LSCSCREENH [UIScreen mainScreen].bounds.size.height
@interface LSCVersionsController ()
/**图片*/
@property (nonatomic, strong) UIImageView *iconView;
/**版本号*/
@property (nonatomic, strong) UILabel *versionsLabel;
@end

@implementation LSCVersionsController
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupData];
}
    /** 图片 */
- (UIImageView *)iconView
{
    if (!_iconView)
    {
        _iconView = [[UIImageView alloc] init];
        self.iconView.image = [UIImage imageNamed:@"about"];
        [self.view addSubview:self.iconView];
    }
    return _iconView;
}


    /** 版本号 */
- (UILabel *)versionsLabel
{
    if (!_versionsLabel)
    {
        _versionsLabel = [[UILabel alloc] init];
        self.versionsLabel.font = LSCVERSIONFONT;
        self.versionsLabel.text = @"版本0.4.4";
        [self.view addSubview:self.versionsLabel];
    }
    return _versionsLabel;
}

- (void)setupData
{
    /** 图片 */
    CGFloat iconX = 0;
    CGFloat iconY = 0;
    CGFloat iconW = LSCSCREENW;
    CGFloat iconH = LSCSCREENH;
    self.iconView.frame = CGRectMake(iconX, iconY, iconW, iconH);
    

    /** 版本号 */
    CGFloat versionsX = LSCSCREENW *.43;
    CGFloat versionsY = LSCSCREENH - 140;
    CGSize versionsSize = [self.versionsLabel.text sizeWithFont:LSCVERSIONFONT];
    self.versionsLabel.frame = (CGRect){{versionsX, versionsY},versionsSize};
    
    
}


@end
