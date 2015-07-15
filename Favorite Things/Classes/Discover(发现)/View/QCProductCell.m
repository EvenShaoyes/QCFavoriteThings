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
#import "QCProductTagButton.h"

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
@property(nonatomic,strong)QCProductTagButton *productTag;

/** 产品工具条  */
@property(nonatomic,strong)QCProductToolBar *productToolBar;

@end

@implementation QCProductCell

+ (instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *const ID = @"product";
    QCProductCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[QCProductCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = [UIColor grayColor];
        cell.contentView.backgroundColor = [UIColor whiteColor];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        /** 头像 */
        self.iconView = [[UIImageView alloc] init];
        [self.contentView addSubview:self.iconView];
        [self.iconView.layer setMasksToBounds:YES];
        
        /** 昵称 */
        self.nicknameLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.nicknameLabel];
        self.nicknameLabel.font = QCProductNicknameFont;
        
        /** 地区 */
        self.provinceLabel = [[UILabel alloc] init];
        self.provinceLabel.font = QCProductProvinceFont;
        [self.contentView addSubview:self.provinceLabel];
        
        /** 关注 */
        self.followBtn = [[UIButton alloc] init];
        [self.followBtn setTitle:@"+ 关注" forState:UIControlStateNormal];
        [self.followBtn setTitleColor:[UIColor colorWithRed:1.000 green:0.000 blue:1.000 alpha:0.200] forState:UIControlStateNormal];
        [self.contentView addSubview:self.followBtn];
        
        /** 产品图片 */
        self.productImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:self.productImageView];
        
        /** 产品标题 */
        self.productTitleLabel = [[UILabel alloc] init];
        self.productTitleLabel.font = QCProductTitleFont;
        [self.contentView addSubview:self.productTitleLabel];
        
        /** 产品描述 */
        self.productDescLabel = [[UILabel alloc] init];
        self.productDescLabel.font = QCProductDescFont;
        self.productDescLabel.numberOfLines = 0;
        self.productDescLabel.textColor = [UIColor grayColor];
        [self.contentView addSubview:self.productDescLabel];
        
        /** 产品标签 */
        self.productTag = [QCProductTagButton buttonWithType:UIButtonTypeCustom];
        [self.productTag setTitleColor:[UIColor colorWithRed:1.000 green:0.000 blue:1.000 alpha:0.520] forState:UIControlStateNormal];
        [self.productTag setImage:[UIImage imageNamed:@"icon-tag"] forState:UIControlStateNormal];
        self.productTag.titleLabel.font = QCProductTagButtonFont;
        [self.contentView addSubview:self.productTag];
        
        /** 产品工具条  */
        self.productToolBar = [[QCProductToolBar alloc] init];
        [self.contentView addSubview:self.productToolBar];
    }
    return self;
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
    self.productDescLabel.text = [product.briefDesc stringByReplacingOccurrencesOfString:@"\n" withString:@" "];
    
    /** 产品标签 */
    [self.productTag setTitle:categorie.name forState:UIControlStateNormal];
}

- (void)layoutSubviews{
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


@end
