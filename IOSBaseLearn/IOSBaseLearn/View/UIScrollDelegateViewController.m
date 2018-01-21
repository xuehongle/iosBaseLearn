//
//  UIScrollDelegateViewController.m
//  IOSBaseLearn
//
//  Created by 薛乐 on 2017/7/7.
//  Copyright © 2017年 xue. All rights reserved.
//

#import "UIScrollDelegateViewController.h"

@interface UIScrollDelegateViewController ()

@property (nonatomic, assign) CGSize fullSize;
@end

@implementation UIScrollDelegateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.fullSize = [UIScreen mainScreen].bounds.size;
    self.navigationController.navigationBar.translucent = NO;
    
    UIScrollView * scrollView = [[UIScrollView alloc]init];
    scrollView.frame = CGRectMake(0, 0, self.fullSize.width, self.fullSize.height - 64);
    scrollView.contentSize = CGSizeMake(self.fullSize.width, (self.fullSize.height - 64) * 9);
    for (int i=0; i<9; i++) {
        NSString * str = [NSString stringWithFormat:@"guide0%d.jpg", i%3 +1];
        UIImage * image = [UIImage imageNamed:str];
        UIImageView * imageView = [[UIImageView alloc]initWithImage:image];
        imageView.frame = CGRectMake(0, i * (self.fullSize.height - 64), self.fullSize.width, self.fullSize.height - 64);
        [scrollView addSubview:imageView];
        
    }
//    scrollView.pagingEnabled = YES;
    scrollView.delegate = self;
    //contentInset 该属性常被用于UITableView中以解决最后一行cell被底部控件遮住的问题。
    scrollView.contentInset = UIEdgeInsetsMake(0, 0, 50, 0);
    [self.view addSubview:scrollView];
}

#pragma mark: -
#pragma mark: - delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSLog(@"y = %f", scrollView.contentOffset.y);
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    NSLog(@"将要拖拽时 WillBeginDrag");
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    NSLog(@"不再拖拽时松开手指时 DidEndDrag");
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView {
    NSLog(@"将要减速时 WillBeginDecelerat");
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSLog(@"减速完毕时 WillBeginDecelerat");
}

@end
