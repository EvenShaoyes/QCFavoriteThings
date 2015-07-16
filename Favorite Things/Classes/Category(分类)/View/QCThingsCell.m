//
//  QCThingsCell.m
//  Favorite Things
//
//  Created by Joe-c on 15/7/15.
//  Copyright (c) 2015年 Joe-c. All rights reserved.
//

#import "QCThingsCell.h"
#import "QCDataModels.h"
#import "UIImageView+WebCache.h"

@interface QCThingsCell ()
@property (weak, nonatomic) IBOutlet UIImageView *productImage;
@property (weak, nonatomic) IBOutlet UILabel *productDesc;

@end

@implementation QCThingsCell


- (void)setProduct:(QCProduct *)product{
    _product = product;
    
    [self.productImage sd_setImageWithURL:[NSURL URLWithString:product.imageUrl]];
    self.productDesc.text = product.name;
    
}


@end
