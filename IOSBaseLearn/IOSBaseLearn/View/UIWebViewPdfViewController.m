//
//  UIWebViewPdfViewController.m
//  IOSBaseLearn
//
//  Created by xue on 2017/9/7.
//  Copyright © 2017年 xue. All rights reserved.
//

#import "UIWebViewPdfViewController.h"

@interface UIWebViewPdfViewController ()

@property (nonatomic, strong) UIWebView * webView;
@end

@implementation UIWebViewPdfViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _webView = [[UIWebView alloc]init];
    _webView.frame = CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    
    [self.view addSubview:_webView];
    
    [self loadLocalFile1];
}

#pragma mark - 加载本地文件
//- (void)loadLocalFile2 {
//    NSURL *url = [[NSBundle mainBundle] URLForResource:@"webview.pdf" withExtension:nil];
//    NSURLRequest *request = [NSURLRequest requestWithURL:url];
//    
//    // 发起同步方法
//    NSURLResponse *response = nil;
//    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:NULL];
//    
//    [self.webView loadData:data MIMEType:response.MIMEType textEncodingName:@"UTF8" baseURL:nil];
//}

- (void)loadLocalFile1 {
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"webview.pdf" withExtension:nil];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [self.webView loadRequest:request];
}

@end
