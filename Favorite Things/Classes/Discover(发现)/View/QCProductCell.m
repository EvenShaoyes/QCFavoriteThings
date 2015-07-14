//
//  QCProductCell.m
//  Favorite Things
//
//  Created by Joe-c on 15/7/13.
//  Copyright (c) 2015年 Joe-c. All rights reserved.
//

#import "QCProductCell.h"
#import "QCProductToolBar.h"
#import "UIView+Extend.h"
#import "NSString+extend.h"
#import "QCDataModels.h"
#import "UIImageView+WebCache.h"

/** view 之间的间距 */
#define QCProductMargin 10

/** 昵称字体 */
#define QCProductNicknameFont [UIFont systemFontOfSize:17]

/** 地区字体 */
#define QCProductProvinceFont [UIFont systemFontOfSize:14]

/** 产品标题字体 */
#define QCProductTitleFont [UIFont boldSystemFontOfSize:20]

/** 产品描述字体 */
#define QCProductDescFont [UIFont systemFontOfSize:16]

@interface QCProductCell ()

/** 头像 */
@property(nonatomic,strong)UIImageView *iconView;

/** 昵称 */
@property(nonatomic,strong)UILabel *nicknameLabel;

/** 地区 */
@property(nonatomic,strong)UILabel *provinceLabel;

/** 关注 */
@property(nonatomic,strong)UIButton *followBtn;

/** 产品图片 */
@property(nonatomic,strong)UIImageView *productImageView;

/** 产品标题 */
@property(nonatomic,strong)UILabel *productTitleLabel;

/** 产品描述 */
@property(nonatomic,strong)UILabel *productDescLabel;

/** 产品标签 */
@property(nonatomic,strong)UIButton *productTag;

/** 产品工具条  */
@property(nonatomic,strong)QCProductToolBar *productToolBar;

@end

@implementation QCProductCell

#pragma make 懒加载
/** 头像 */
- (UIImageView *)iconView{
    if (!_iconView) {
        _iconView = [[UIImageView alloc] init];
        [self.contentView addSubview:_iconView];
        [_iconView.layer setMasksToBounds:YES];
    }
    return _iconView;
}

/** 昵称 */
- (UILabel *)nicknameLabel{
    if (!_nicknameLabel) {
        _nicknameLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_nicknameLabel];
        _nicknameLabel.font = QCProductNicknameFont;
    }
    return _nicknameLabel;
}

/** 地区 */
- (UILabel *)provinceLabel{
    if (!_provinceLabel) {
        _provinceLabel = [[UILabel alloc] init];
        _provinceLabel.font = QCProductProvinceFont;
        [self.contentView addSubview:_provinceLabel];
    }
    return _provinceLabel;
}

/** 关注 */
- (UIButton *)followBtn{
    if (!_followBtn) {
        _followBtn = [[UIButton alloc] init];
        [_followBtn setTitle:@"+ 关注" forState:UIControlStateNormal];
        [_followBtn setTitleColor:[UIColor colorWithRed:1.000 green:0.000 blue:1.000 alpha:0.200] forState:UIControlStateNormal];
        [self.contentView addSubview:_followBtn];
    }
    return _followBtn;
}

/** 产品图片 */
- (UIImageView *)productImageView{
    if (!_productImageView) {
        _productImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:_productImageView];
    }
    return _productImageView;
}

/** 产品标题 */
- (UILabel *)productTitleLabel{
    if (!_productTitleLabel) {
        _productTitleLabel = [[UILabel alloc] init];
        _productTitleLabel.font = QCProductTitleFont;
//        _productTitleLabel
        [self.contentView addSubview:_productTitleLabel];
    }
    return _productTitleLabel;
}

/** 产品描述 */
- (UILabel *)productDescLabel{
    if (!_productDescLabel) {
        _productDescLabel = [[UILabel alloc] init];
        _productDescLabel.font = QCProductDescFont;
        _productDescLabel.numberOfLines = 0;
        _productDescLabel.textColor = [UIColor grayColor];
        [self.contentView addSubview:_productDescLabel];
    }
    return _productDescLabel;
}

/** 产品标签 */
- (UIButton *)productTag{
    if (!_productTag) {
        _productTag = [UIButton buttonWithType:UIButtonTypeCustom];
        [_productTag setTitleColor:[UIColor colorWithRed:1.000 green:0.000 blue:1.000 alpha:0.520] forState:UIControlStateNormal];
        [_productTag setImage:[UIImage imageNamed:@"icon-tag"] forState:UIControlStateNormal];
        _productTag.imageEdgeInsets = UIEdgeInsetsMake(0, -58, 0, 0);
        _productTag.titleEdgeInsets = UIEdgeInsetsMake(0, -38, 0, 0);

        [self.contentView addSubview:_productTag];
    }
    return _productTag;
}

/** 产品工具条  */
- (QCProductToolBar *)productToolBar{
    if (!_productToolBar) {
        _productToolBar = [[QCProductToolBar alloc] init];
        [self.contentView addSubview:_productToolBar];
    }
    return _productToolBar;
}

+ (instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *const ID = @"product";
    QCProductCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[QCProductCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}


-  (void)layoutSubviews{
    [super layoutSubviews];
    
    
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
    CGFloat followX = self.width - followW - (QCProductMargin * 2);
    CGFloat followY = (iconMaxY - followH) * .5;
    self.followBtn.frame = CGRectMake(followX, followY, followW, followH);
    
    /** 产品图片 */
    CGFloat productImageX = 0;
    CGFloat productImageY = iconMaxY + QCProductMargin;
    CGFloat productImageW = self.width;
    CGFloat productImageH = 230;
    self.productImageView.frame = CGRectMake(productImageX, productImageY, productImageW, productImageH);
    
    /** 产品标题 */
    CGFloat productTitleX = 10;
    CGFloat productTitleY = self.productImageView.maxY + QCProductMargin;
    CGSize productTitleSize = [self.productTitleLabel.text sizeWithFont:QCProductTitleFont];
    self.productTitleLabel.frame = (CGRect){{productTitleX, productTitleY},productTitleSize};
    
    /** 产品描述 */
    CGFloat productDescX = productTitleX;
    CGFloat productDescY = self.productTitleLabel.maxY + QCProductMargin;
    CGFloat productDescW = self.width - productDescX * 2;
    CGSize productDescSize = [self.productDescLabel.text sizeWithFont:QCProductDescFont size:CGSizeMake(productDescW,60)];
    self.productDescLabel.frame = (CGRect){{productDescX,productDescY},productDescSize};
    
    /** 产品标签 */
    CGFloat productTagX = productDescX;
    CGFloat productTagY = self.productDescLabel.maxY + QCProductMargin;
    CGFloat productTagW = 150;
    CGFloat productTagH = 25;
    self.productTag.frame = CGRectMake(productTagX, productTagY, productTagW, productTagH);
    
    /** 产品工具条  */
    CGFloat productToolX = 0;
    CGFloat productToolY = self.productTag.maxY + QCProductMargin;
    CGFloat productToolW = self.width;
    CGFloat productToolH = 40;
    self.productToolBar.frame = CGRectMake(productToolX, productToolY, productToolW, productToolH);
    
    
    
    self.iconView.layer.cornerRadius = self.iconView.width * .5;


}

- (void)setProduct:(QCProduct *)product{
    _product = product;
    
    QCUploadUser *user = product.uploadUser;
    QCCategories *categorie = [product.categories firstObject];

    /** 头像 */
    [self.iconView sd_setImageWithURL:[NSURL URLWithString:user.avatarUrl] placeholderImage:nil];
    
    /** 昵称 */
    self.nicknameLabel.text = user.username;
    
    /** 地区 */
    self.provinceLabel.text = user.province;
    
    /** 产品图片 */
    [self.productImageView sd_setImageWithURL:[NSURL URLWithString:product.imageUrl] placeholderImage:[UIImage imageNamed:@"placeholder"]];
    
    /** 产品标题 */
    self.productTitleLabel.text = product.name;
    
    /** 产品描述 */
    self.productDescLabel.text = product.briefDesc;
    
    /** 产品标签 */
    [self.productTag setTitle:categorie.name forState:UIControlStateNormal];

}

@end
