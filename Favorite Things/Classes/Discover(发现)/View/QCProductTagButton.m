//
//  QCProductTagButton.m
//  Favorite Things
//
//  Created by Joe-c on 15/7/13.
//  Copyright (c) 2015年 Joe-c. All rights reserved.
//

#import "QCProductTagButton.h"
#import "UIView+Extend.h"
#import "NSString+extend.h"

@implementation QCProductTagButton

- (void)layoutSubviews{
    [super layoutSubviews];
    
    self.imageView.x = 0;
    self.imageView.size = self.imageView.image.size;
    self.imageView.y = (self.height - self.imageView.height) * .5;

    self.titleLabel.x = self.imageView.width + 15;
    self.titleLabel.size = [self.titleLabel.text sizeWithFont:QCProductTagButtonFon];
    self.titleLabel.y = (self.height - self.titleLabel.height) * .5;
    
    self.width = self.titleLabel.maxX;
    
}

@end
