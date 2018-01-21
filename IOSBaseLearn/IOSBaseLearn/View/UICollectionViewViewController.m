//
//  UICollectionViewViewController.m
//  IOSBaseLearn
//
//  Created by xue on 2017/7/18.
//  Copyright © 2017年 xue. All rights reserved.
//

#import "UICollectionViewViewController.h"
#import "MyCollectionViewCell.h"

@interface UICollectionViewViewController () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic) UICollectionView * collectionView;
@end

@implementation UICollectionViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
    layout.minimumLineSpacing = 10; //最小行间距
    layout.minimumInteritemSpacing = 10; //最小列间距
    layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10); //边距
    layout.scrollDirection = UICollectionViewScrollDirectionVertical; //滚动方向
    
    CGRect cgRect = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 64);
    self.collectionView = [[UICollectionView alloc]initWithFrame:cgRect collectionViewLayout:layout];
    [self.view addSubview:self.collectionView];
    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    [self.collectionView registerClass:[MyCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 20;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MyCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.iView.image = [UIImage imageNamed:@"tom3.png"];
    NSString * str = [NSString stringWithFormat:@"%ld", indexPath.row];
    cell.label.text = str;
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(100, 100);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"点击了%ld", indexPath.row);
}

@end
