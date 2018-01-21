//
//  UIWebViewJSViewController.m
//  IOSBaseLearn
//
//  Created by xue on 2017/9/7.
//  Copyright © 2017年 xue. All rights reserved.
//

#import "UIWebViewJSViewController.h"

@interface UIWebViewJSViewController () <UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation UIWebViewJSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.webView.delegate = self;
    
    [self loadHTML];
    
}

#pragma mark - 页面调用OC方法
// 是由页面调用的方法
- (void)myMessage:(NSString *)str {
    [[[UIAlertView alloc] initWithTitle:@"tips" message:str delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
}

/**
 参数
 webView: 自己
 request: 请求，webView要加载的网络请求
 navigationType: 是否在新窗口中打开
 
 返回值 BOOL
 
 技巧：OC的代理方法，如果有 BOOL 返回值
 说明：YES   一切正常
 NO    不工作
 */
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    
    NSLog(@"%s %@", __FUNCTION__, request.URL);
    // 思路：根据URL不同来做不同的动作
    // 如果是 meilishuo:// 表示自定义协议，需要执行OC方法
    if ([request.URL.scheme isEqualToString:@"meilishuo"]) {
        
        NSLog(@"URL中的路径组成部分 %@", request.URL.pathComponents);
        
        // meilishuo:///myMessage:/olleH => 调用 myMessage: 方法传递 olleH 参数
        // url的参数 pathComponents
        
        // 从URL中获得所有的路径组成部分
        NSArray *array = request.URL.pathComponents;
        // array[1] => 方法名
        // array[2] => 参数
        if (array.count != 3) {
            return NO;
        }
        
        NSString *funcName = array[1];
        NSString *param = array[2];
        
        // funcName 如果能够变成可以执行的方法
        UIButton *btn = nil;
        // action 的类型 SEL，可以执行的方法
        [btn addTarget:self action:@selector(myMessage:) forControlEvents:UIControlEventTouchUpInside];
        
        SEL func = NSSelectorFromString(funcName);
        
        // 执行func 并且传入参数
        if ([self respondsToSelector:func]) {
            // 在iOS开发中，苹果任务这种方式是不安全的！
            // clang 是负责编译 OC 程序的
            // #pragma clang diagnostic 这个技巧，在 AFN 中出现的频率非常高！
            // 让 clang 编译到这一行的时候，压栈
#pragma clang diagnostic push
            // 让clang 忽略 -Warc-performSelector-leaks 警告信息
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
            [self performSelector:func withObject:param];
            // 让 clang 出栈
#pragma clang diagnostic pop
        } else {
            NSLog(@"方法名错误");
        }
        
        // 返回NO，不再调用网络请求
        return NO;
    }
    
    return YES;
}

#pragma mark - 跟Web View的交互
/**
 1. 显示html内容
 2. 与页面交互－调用页面中的脚本（为了保证能够执行到js，应该在页面完全显示后，再执行js）
 2.1 确定（监听）页面已经完全被加载
 2.2 在OC中，让webview执行脚本只有一个方法
 - (NSString *)stringByEvaluatingJavaScriptFromString:(NSString *)script;
 3. 让页面调用oc中的方法
 3.1 准备被调用的方法
 3.2 监听到用户的点击 href
 
 */
- (void)loadHTML {
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"demo.html" withExtension:nil];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [self.webView loadRequest:request];
}

#pragma mark - webview代理方法
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    // 执行脚本
    // 参数：要执行的 js 的函数名
    //    [webView stringByEvaluatingJavaScriptFromString:@"clickme();"];
    
    // 提示：具体的js的函数可以咨询网页设计人员，或者需要的时候查询 w3c
    NSString *result = [webView stringByEvaluatingJavaScriptFromString:@"document.title"];
    NSLog(@"title %@", result);
}


@end
