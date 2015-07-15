//
//  QCProductDescControllerViewController.m
//  Favorite Things
//
//  Created by Joe-c on 15/7/14.
//  Copyright (c) 2015年 Joe-c. All rights reserved.
//

#import "QCProductDescControllerViewController.h"
#import "UIView+Extend.h"
#import "NSString+extend.h"
/** view 之间的间距 */
#define QCProductMargin 10

/** 昵称字体 */
#define QCProductNicknameFont [UIFont systemFontOfSize:17]

/** 地区字体 */
#define QCProductProvinceFont [UIFont systemFontOfSize:14]
@interface QCProductDescControllerViewController ()
@property(nonatomic,strong)UIScrollView *scrollView;
/** 头像 */
@property(nonatomic,strong)UIImageView *iconView;

/** 昵称 */
@property(nonatomic,strong)UILabel *nicknameLabel;

/** 地区 */
@property(nonatomic,strong)UILabel *provinceLabel;

/** 关注 */
@property(nonatomic,strong)UIButton *followBtn;
@end

@implementation QCProductDescControllerViewController

- (UIScrollView *)scrollView{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
        [self.view addSubview:_scrollView];
    }
    return _scrollView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.scrollView.contentSize = CGSizeMake(0, 1000);

    [self setupUI];
    
    [self setupFrame];
}

- (void)setupFrame{
    /** 头像 */
    CGFloat iconX = QCProductMargin;
    CGFloat iconY = QCProductMargin;
    CGFloat iconW = 40;
    CGFloat iconH = iconW;
    self.iconView.frame = CGRectMake(iconX, iconY, iconW, iconH);
    
    /** 昵称 */
    CGFloat nicknameX = self.iconView.maxX + QCProductMargin;
    CGFloat nicknameY = iconY;
    CGSize nickNameSize = [self.nicknameLabel.text sizeWithFont:QCProductNicknameFont];
    self.nicknameLabel.frame = (CGRect){{nicknameX,nicknameY},nickNameSize};
    
    /** 地区 */
    CGFloat provinceX = nicknameX;
    CGFloat provinceY = self.nicknameLabel.maxY + QCProductMargin;
    CGSize provinceSize = [self.provinceLabel.text sizeWithFont:QCProductProvinceFont];
    self.provinceLabel.frame = (CGRect){{provinceX,provinceY},provinceSize};
    
    CGFloat iconMaxY = MAX(self.iconView.maxY, self.provinceLabel.maxY);
    
    /** 关注 */
    CGFloat followW = 80;
    CGFloat followH = 28;
    CGFloat followX = self.view.width - followW - (QCProductMargin * 2);
    CGFloat followY = (iconMaxY - followH) * .5;
    self.followBtn.frame = CGRectMake(followX, followY, followW, followH);
}
- (void)setupUI{
    /** 头像 */
    self.iconView = [[UIImageView alloc] init];
    [self.view addSubview:self.iconView];
    [self.iconView.layer setMasksToBounds:YES];
    
    /** 昵称 */
    self.nicknameLabel = [[UILabel alloc] init];
    [self.view addSubview:self.nicknameLabel];
    self.nicknameLabel.font = QCProductNicknameFont;
    
    /** 地区 */
    self.provinceLabel = [[UILabel alloc] init];
    self.provinceLabel.font = QCProductProvinceFont;
    [self.view addSubview:self.provinceLabel];
    
    /** 关注 */
    self.followBtn = [[UIButton alloc] init];
    [self.followBtn setTitle:@"+ 关注" forState:UIControlStateNormal];
    [self.followBtn setTitleColor:[UIColor colorWithRed:1.000 green:0.000 blue:1.000 alpha:0.200] forState:UIControlStateNormal];
    [self.view addSubview:self.followBtn];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
