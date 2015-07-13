//
//  UIView+Extend.h
//  微博
//
//  Created by Joe-c on 15/6/5.
//  Copyright (c) 2015年 Joe-c. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Extend)

@property (nonatomic ,assign)CGFloat x;
@property (nonatomic ,assign)CGFloat y;
@property (nonatomic ,assign)CGFloat width;
@property (nonatomic ,assign)CGFloat height;
@property (nonatomic ,assign)CGSize size;
@property (nonatomic ,assign)CGPoint origin;
@property(nonatomic,assign)CGFloat centerX;
@property(nonatomic,assign)CGFloat centerY;
@property(nonatomic,assign,readonly)CGFloat maxX;
@property(nonatomic,assign,readonly)CGFloat maxY;



@end
