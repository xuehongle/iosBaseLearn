//
//  NSURLConnectViewController.m
//  IOSBaseLearn
//
//  Created by 薛乐 on 2017/7/14.
//  Copyright © 2017年 xue. All rights reserved.
//

#import "NSURLConnectViewController.h"

@interface NSURLConnectViewController () <NSURLSessionDataDelegate>

@property (nonatomic, strong) NSMutableData * data;
@end

@implementation NSURLConnectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(10, 70, 50, 30);
    [btn setTitle:@"连接" forState:UIControlStateNormal];
    [btn addTarget: self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    self.data = [[NSMutableData alloc]init];
}

- (void) btnClick {
//    NSURL * url = [NSURL URLWithString:@"https://m.baidu.com"];
    NSURL * url = [NSURL URLWithString:@"http://120.25.226.186:32812/login?username=520it&pwd=520it&type=JSON"];
    NSMutableURLRequest * request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"Get";
    // 设置请求头
//    [request setValue:@"iPhone AppleWebKit" forHTTPHeaderField:@"User-Agent"];
    
//    NSURLConnection在iOS9被宣布弃用,NSURLSession
//    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:self delegateQueue:[NSOperationQueue mainQueue]];
//    NSURLSessionTask * task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//        NSString * str = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
//        NSLog(@"%@", str);
//    }];
    NSURLSessionDataTask * task = [session dataTaskWithRequest:request];
    
    [task resume];

}

#pragma mark: - delegate
//1.接收到服务器响应的时候调用该方法
- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveResponse:(NSURLResponse *)response completionHandler:(void (^)(NSURLSessionResponseDisposition))completionHandler {
    //在该方法中可以得到响应头信息，即response
    NSLog(@"didReceiveResponse--%@",[NSThread currentThread]);
    
    //注意：需要使用completionHandler回调告诉系统应该如何处理服务器返回的数据
    //默认是取消的
    /*
     NSURLSessionResponseCancel = 0,        默认的处理方式，取消
     NSURLSessionResponseAllow = 1,         接收服务器返回的数据
     NSURLSessionResponseBecomeDownload = 2,变成一个下载请求
     NSURLSessionResponseBecomeStream        变成一个流
     */
    
    completionHandler(NSURLSessionResponseAllow);
}

//2.接收到服务器返回数据的时候会调用该方法，如果数据较大那么该方法可能会调用多次
- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveData:(NSData *)data {
    NSLog(@"didReceiveData--%@",[NSThread currentThread]);
    //拼接服务器返回的数据
    [self.data appendData:data];
}

//3.当请求完成(成功|失败)的时候会调用该方法，如果请求失败，则error有值
- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error {
    NSLog(@"didCompleteWithError--%@",[NSThread currentThread]);
    if(error == nil) {
        NSString * str = [[NSString alloc]initWithData:self.data encoding:NSUTF8StringEncoding];
        NSLog(@"%@", str);
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:self.data options:kNilOptions error:nil];
        NSLog(@"%@ %@", dict, dict[@"success"]);
        
    }
}

@end
