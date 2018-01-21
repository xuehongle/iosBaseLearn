//
//  UIWebViewViewController.m
//  IOSBaseLearn
//
//  Created by xue on 2017/9/7.
//  Copyright © 2017年 xue. All rights reserved.
//

#import "UIWebViewViewController.h"
#import "UIWebViewBaseViewController.h"
#import "UIWebViewPdfViewController.h"
#import "UIWebViewJSViewController.h"

@interface UIWebViewViewController ()

@end

@implementation UIWebViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (IBAction)loadWebPage:(id)sender {
    UIViewController * vc = [[UIWebViewBaseViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)loadPdf:(id)sender {
    UIViewController * vc = [[UIWebViewPdfViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)loadJS:(id)sender {
    UIViewController * vc = [[UIWebViewJSViewController alloc]initWithNibName:@"UIWebViewJSViewController" bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
