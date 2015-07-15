//
//  QCCategoryCell.m
//  Favorite Things
//
//  Created by Joe-c on 15/7/15.
//  Copyright (c) 2015年 Joe-c. All rights reserved.
//

#import "QCCategoryCell.h"
#import "QCCategories.h"
#import "UIImageView+WebCache.h"

@interface QCCategoryCell()

/**
 *  分类的名称
 */
@property (weak, nonatomic) IBOutlet UILabel *categoryName;

/**
 *  分类的描述
 */
@property (weak, nonatomic) IBOutlet UILabel *categoryDesc;

/**
 *  分类的图片
 */
@property (weak, nonatomic) IBOutlet UIImageView *categoryImage;

@end

@implementation QCCategoryCell

+ (instancetype)cell{
    return [[[NSBundle mainBundle] loadNibNamed:@"QCCategoryCell" owner:nil options:nil] lastObject];
}

+ (instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *const ID = @"category";
    QCCategoryCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [QCCategoryCell cell];;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

- (void)setCategory:(QCCategories *)category{
    _category = category;
    self.categoryName.text = category.name;
    self.categoryDesc.text = category.desc;
//    [self.categoryImage sd_setImageWithURL:category.ur]
}


@end
