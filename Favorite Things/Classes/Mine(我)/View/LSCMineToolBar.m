//
//  LSCMineToolBar.m
//  Favorite Things
//
//  Created by 兜麦 on 15/7/16.
//  Copyright (c) 2015年 Joe-c. All rights reserved.
//

#import "LSCMineToolBar.h"
#import "UIView+Extend.h"

@interface LSCMineToolBar ()
/** 晒好物 */
@property (nonatomic, strong) UIButton *favoriteButton;

/** 喜欢 */
@property (nonatomic, strong) UIButton *likeButton;

/** 拥有 */
@property (nonatomic, strong) UIButton *possessButton;

/** 所有的按钮 */
@property(nonatomic,strong)NSMutableArray *buttons;

/** 所有的分割线 */
@property(nonatomic,strong)NSMutableArray *dividers;

@end


@implementation LSCMineToolBar

- (NSMutableArray *)buttons
{
    if (!_buttons)
    {
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

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        
        [self addBtnWithTitle:@"晒好物"];
        [self addBtnWithTitle:@"喜欢"];
        [self addBtnWithTitle:@"拥有"];
        
        [self addDivider];
        [self addDivider];
        [self addDivider];
        
    }
    
    return self;
}

    /** 创建button  设置按钮标题*/
- (UIButton *)addBtnWithTitle:(NSString *)title
{
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:14];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self addSubview:button];
    [self.buttons addObject:button];
    return button;
    
}


    /** 添加分割线 */

- (void)addDivider
{
    UIImageView *divider = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"timeline_card_bottom_line"]];
    [self addSubview:divider];
    [self.dividers addObject:divider];
}


    /** 设置子控件Frame */
- (void)layoutSubviews
{
    [super layoutSubviews];
    NSInteger buttonCount = self.buttons.count;
    CGFloat buttonW = self.width / buttonCount;
    for (int i = 0; i < buttonCount; i++)
    {
        UIButton *button = self.subviews[i];
        button.height = self.height;
        button.width = buttonW;
        button.x = i * buttonW;
        button.y = 0;
    }
    
    NSInteger dividerCount = self.dividers.count;
    for (int i = 0; i < dividerCount; i ++)
    {
        UIImageView *dividerImage = self.dividers[i];
        if (i == 2)
        {
            dividerImage.x = 0;
            dividerImage.y = 1;
            dividerImage.width = self.width;
            dividerImage.height = 1;
        }else
        {
            dividerImage.x = (i + 1) * buttonW;
            dividerImage.y = 0;
            dividerImage.width = 1;
            dividerImage.height = self.height;
        }
    }
}

@end
