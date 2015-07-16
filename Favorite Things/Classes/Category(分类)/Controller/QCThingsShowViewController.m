//
//  QCThingsShowViewController.m
//  Favorite Things
//
//  Created by Joe-c on 15/7/15.
//  Copyright (c) 2015年 Joe-c. All rights reserved.
//

#import "QCThingsShowViewController.h"
#import "UIView+Extend.h"
#import "QCThingsCell.h"

@interface QCThingsShowViewController ()


@end

@implementation QCThingsShowViewController

static NSString *const ID =@"category";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"QCThingsCell" bundle:nil] forCellWithReuseIdentifier:ID];
    self.collectionView.backgroundColor = [UIColor colorWithRed:0.949 green:0.949 blue:0.949 alpha:1];

}

- (instancetype)init{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    CGFloat w = ([UIScreen mainScreen].bounds.size.width - 55) * .5;
    layout.itemSize = CGSizeMake(w, 200);
    layout.minimumInteritemSpacing = 20;
    layout.minimumLineSpacing = 25;
    layout.sectionInset = UIEdgeInsetsMake(15, 15, 0, 15);
    return [super initWithCollectionViewLayout: layout];
}



- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    return self.productList.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    QCThingsCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    cell.product = self.productList[indexPath.row];
    return cell;
}

- (void)setProductList:(NSArray *)productList{
    _productList = productList;
    
    [self.collectionView reloadData];
    
}


@end
