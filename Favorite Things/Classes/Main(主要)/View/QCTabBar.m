//
//  QCTabBar.m
//  Favorite Things
//
//  Created by Joe-c on 15/7/13.
//  Copyright (c) 2015年 Joe-c. All rights reserved.
//

#import "QCTabBar.h"
#import "UIView+Extend.h"

@interface QCTabBar ()

@property(nonatomic,strong)UIButton *plusBtn;

@end

@implementation QCTabBar

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
     
        self.plusBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.plusBtn setImage:[UIImage imageNamed:@"upload"] forState:UIControlStateNormal];
        [self.plusBtn addTarget:self action:@selector(clickPlusBtn) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.plusBtn];
    
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    self.plusBtn.size = self.plusBtn.imageView.image.size;
    self.plusBtn.centerX = self.width * .5;
    self.plusBtn.centerY = self.height * .5;
    
    CGFloat width = self.width * .2;
    
    NSInteger index = 0;
    
    for (UIView *child in self.subviews) {
        if ([child isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            child.width = width;
            child.x = index * width;
            index ++;
        
            if (2 == index)  index ++;
        }
    }
}

- (void)clickPlusBtn{
    
    if ([self.delegate respondsToSelector:@selector(tabBarClickPlusBtn:)]) {
        [self.delegate tabBarClickPlusBtn:self];
    }
    
}



@end