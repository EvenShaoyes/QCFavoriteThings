//
//  QCProductToolBar.m
//  Favorite Things
//
//  Created by Joe-c on 15/7/13.
//  Copyright (c) 2015年 Joe-c. All rights reserved.
//

#import "QCProductToolBar.h"
#import "UIView+Extend.h"

@interface QCProductToolBar ()



/** 喜欢 */
@property(nonatomic,strong)UIButton *likeBtn;

/** 拥有 */
@property(nonatomic,strong)UIButton *wantBtn;

/** 评论 */
@property(nonatomic,strong)UIButton *commentBtn;

/** 所有的按钮 */
@property(nonatomic,strong)NSMutableArray *buttons;

/** 所有的分割线 */
@property(nonatomic,strong)NSMutableArray *dividers;


@end

@implementation QCProductToolBar


#pragma make 懒加载

- (NSMutableArray *)buttons{
    if (!_buttons) {
        _buttons = [NSMutableArray array];
    }
    return _buttons;
}

- (NSMutableArray *)dividers{
    if (!_dividers) {
        _dividers = [NSMutableArray array];
    }
    return _dividers;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"timeline_card_bottom_background"]];
        
        [self addBtnWithTitle:@"喜欢" image:@"like" selectImage:@"like_on"];
        [self addBtnWithTitle:@"拥有" image:@"want" selectImage:@"want_on"];
        [self addBtnWithTitle:@"评论" image:@"discussion" selectImage:@"discussion"];
        
        [self addDivider];
        [self addDivider];
        [self addDivider];
    
    }
    
    return self;
}

/**
 *  添加按钮
 *
 *  @param title       标题
 *  @param image       图片
 *  @param selectImage 选中图片
 *
 *  @return 按钮
 */
- (UIButton *)addBtnWithTitle:(NSString *)title image:(NSString *)image selectImage:(NSString *)selectImage{
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:selectImage] forState:UIControlStateSelected];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    [self addSubview:btn];
    [self.buttons addObject:btn];
    return btn;
}
/**
 *  添加分割线
 */
- (void)addDivider{
    UIImageView *divider = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"timeline_card_bottom_line"]];
    [self addSubview:divider];
    [self.dividers addObject:divider];
}

- (void)layoutSubviews{
    [super layoutSubviews];

    NSInteger buttonCount = self.buttons.count;
    CGFloat btnW = self.width / buttonCount;
    for (int i = 0; i < buttonCount; i ++) {
        UIButton *btn = self.subviews[i];
        btn.height = self.height;
        btn.width = btnW;
        btn.x = i * btn.width;
        btn.y = 0;
    }
    
    NSInteger divCount = self.dividers.count;
    for (int i = 0; i < divCount; i ++) {
        UIImageView *imgV = self.dividers[i];
        if (i == 2) {
            imgV.x = 0;
            imgV.y = 1;
            imgV.width = self.width;
            imgV.height = 1;
        }else{
            imgV.x = (i + 1) * btnW;
            imgV.y = 0;
            imgV.width = 1;
            imgV.height = self.height;
        }
    }
}

@end
