//
//  UIWebViewViewController.m
//  IOSBaseLearn
//
//  Created by 薛乐 on 2017/7/13.
//  Copyright © 2017年 xue. All rights reserved.
//

#import "UIWebViewBaseViewController.h"

@interface UIWebViewBaseViewController () <UIWebViewDelegate>

@property (nonatomic, strong) UIActivityIndicatorView * activityIndicatiorView;
@property (nonatomic, strong) UIWebView * webView;
@end

@implementation UIWebViewBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect fullSize = [UIScreen mainScreen].bounds;
    
    self.activityIndicatiorView = [[UIActivityIndicatorView alloc]init];
    self.activityIndicatiorView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
    self.activityIndicatiorView.center = CGPointMake(fullSize.size.width / 2, fullSize.size.height / 2);
    [self.view addSubview:self.activityIndicatiorView];
    
    UIButton *btn0 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn0.frame = CGRectMake(10, 500, 50, 40);
    [btn0 setTitle:@"上一页" forState:UIControlStateNormal];
    [btn0 addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn0];
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn1.frame = CGRectMake(70, 500, 50, 40);
    [btn1 setTitle:@"下一页" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(forward) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn2.frame = CGRectMake(10, 550, 50, 40);
    [btn2 setTitle:@"刷新" forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(reload) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
    
    UIButton *btn3 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn3.frame = CGRectMake(70, 550, 50, 40);
    [btn3 setTitle:@"停止" forState:UIControlStateNormal];
    [btn3 addTarget:self action:@selector(stop) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn3];
    
    _webView = [[UIWebView alloc]init];
    _webView.frame = CGRectMake(0, 64, fullSize.size.width, 400);
    
    [self.view addSubview:_webView];
    _webView.delegate = self;
    
    [self go];
    
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(10, 600, fullSize.size.width-20, 70)];
    label.numberOfLines = 0;
    label.text = @"在ios9之后，UIWebView默认只能加载https的，想要http的需改info.plist";
    
    [self.view addSubview:label];
}

- (void) go {
    [self.view endEditing:YES];
    
    NSURL * url = [NSURL URLWithString:@"https://m.baidu.com"];
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    [_webView loadRequest:request];
}

- (void) back {
    [_webView goBack];
}

- (void) forward {
    [_webView goForward];
}

- (void) reload {
    [_webView reload];
}

- (void) stop {
    [_webView stopLoading];
    [self.activityIndicatiorView stopAnimating];
}

#pragma mark: - delegate
- (void)webViewDidStartLoad:(UIWebView *)webView {
    [self.activityIndicatiorView startAnimating];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [self.activityIndicatiorView stopAnimating];
}
@end
