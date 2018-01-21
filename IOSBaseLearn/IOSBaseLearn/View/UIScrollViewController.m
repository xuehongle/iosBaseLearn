//
//  UIScrollViewController.m
//  IOSBaseLearn
//
//  Created by xue on 2017/7/7.
//  Copyright © 2017年 xue. All rights reserved.
//

#import "UIScrollViewController.h"

@interface UIScrollViewController () <UIScrollViewDelegate>

@property (nonatomic, assign) CGSize fullSize;
@property (nonatomic, strong) UIPageControl *pageControl;
@property (nonatomic, strong) UIScrollView *scrollView;
@end

@implementation UIScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.fullSize = [UIScreen mainScreen].bounds.size;
//    self.edgesForExtendedLayout = UIRectEdgeNone;
//    self.automaticallyAdjustsScrollViewInsets = NO;
    self.navigationController.navigationBar.translucent = NO;
    
    _scrollView = [[UIScrollView alloc]init];
    _scrollView.frame = CGRectMake(0, 0, self.fullSize.width, self.fullSize.height - 64);
    _scrollView.contentSize = CGSizeMake(self.fullSize.width * 3, self.fullSize.height - 64);
    _scrollView.backgroundColor = [UIColor yellowColor];
    _scrollView.showsVerticalScrollIndicator = YES; // 是否顯示垂直的滑動條
    _scrollView.showsHorizontalScrollIndicator = YES; // 是否顯示水平的滑動條
    _scrollView.indicatorStyle = UIScrollViewIndicatorStyleWhite; // 滑動條的樣式
    _scrollView.scrollsToTop = YES; // 是否可以按狀態列回到最上方
    _scrollView.directionalLockEnabled = NO; // 是否限制滑動時只能單個方向 垂直或水平滑動
    _scrollView.bounces = YES; // 滑動超過範圍時是否使用彈回效果
    _scrollView.alwaysBounceVertical = NO; //是否开启竖向回弹效果  默认如果不设置contentSize,scrollView是没有回弹效果的,可是如果设置了`self.scrollView.alwaysbounceVertical = YES & self.scrollView.alwaysBounceHorizontal = YES `的情况下,水平和垂直方向就都有了回弹效果
    _scrollView.alwaysBounceHorizontal = YES; //是否开启横向回弹效果
    _scrollView.pagingEnabled = YES; //分页
    _scrollView.delegate = self;
    //contentInset 该属性常被用于UITableView中以解决最后一行cell被底部控件遮住的问题。
    _scrollView.contentInset = UIEdgeInsetsMake(0, 150, 0, 0);
    
    for (int i=0; i<3; i++) {
        NSString * name = [NSString stringWithFormat:@"guide0%d.jpg", i+1];
        UIImage *image = [UIImage imageNamed:name];
        UIImageView * imageView = [[UIImageView alloc]initWithImage:image];
        imageView.frame = CGRectMake(self.fullSize.width * i, 0, self.fullSize.width, self.fullSize.height - 64);
        
        [_scrollView addSubview:imageView];
    }
    
    
    [self.view addSubview:_scrollView];
    
    _pageControl = [[UIPageControl alloc]init];
    _pageControl.frame = CGRectMake(0, _fullSize.height - 150, _fullSize.width, 50);
    _pageControl.numberOfPages = 3;
    _pageControl.pageIndicatorTintColor = [UIColor redColor];
    _pageControl.currentPageIndicatorTintColor = [UIColor greenColor];
    [_pageControl addTarget:self action:@selector(pageCon:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:_pageControl];
}

- (void) pageCon: (UIPageControl *)pageControl {
    [_scrollView setContentOffset:CGPointMake(self.fullSize.width * pageControl.currentPage, 0) animated:YES];
}

#pragma mark: - delegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    //写在didscroll里，快速点会小点乱跳，所以写在这里
    NSInteger num = scrollView.contentOffset.x / self.fullSize.width;
    _pageControl.currentPage = num;
}

@end
