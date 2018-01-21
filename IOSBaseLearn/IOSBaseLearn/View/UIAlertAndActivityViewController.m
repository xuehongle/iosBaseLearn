//
//  UIAlertAndActivityViewController.m
//  IOSBaseLearn
//
//  Created by xue on 2017/7/7.
//  Copyright © 2017年 xue. All rights reserved.
//

#import "UIAlertAndActivityViewController.h"

@interface UIAlertAndActivityViewController ()
- (IBAction)alertClick:(id)sender;
- (IBAction)alertThreeClick:(id)sender;
- (IBAction)activityClick:(id)sender;
- (IBAction)actionSheetClick:(id)sender;

@end

@implementation UIAlertAndActivityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    UIAlertView和UIActionSheet 被划线了
}


- (IBAction)alertClick:(id)sender {
    
    // TODO X ui能否修改
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"这个是默认样式" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"点击OK");
    }];
    
    UIAlertAction* cancleAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"点击取消");
    }];
    
    [alert addAction:defaultAction];
    [alert addAction:cancleAction];
    
    [self presentViewController:alert animated:YES completion:nil];
}

- (IBAction)alertThreeClick:(id)sender {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"这个是默认样式" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"点击OK");
    }];
    
    UIAlertAction* cancleAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"点击取消");
    }];
    
    UIAlertAction* otherAction = [UIAlertAction actionWithTitle:@"警告" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"点击警告");
    }];
    
    [alert addAction:defaultAction];
    [alert addAction:cancleAction];
    [alert addAction:otherAction];
    
    [self presentViewController:alert animated:YES completion:nil];
}

- (IBAction)actionSheetClick:(id)sender {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"这个是ActionSheet样式" preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"点击OK");
    }];
    
    UIAlertAction* cancleAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"点击取消");
    }];
    
    UIAlertAction* otherAction = [UIAlertAction actionWithTitle:@"警告" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"点击警告");
    }];
    
    [alert addAction:defaultAction];
    [alert addAction:cancleAction];
    [alert addAction:otherAction];
    
    [self presentViewController:alert animated:YES completion:nil];
}

- (IBAction)activityClick:(id)sender {
    UIActivityIndicatorView * activityView = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(100, 300, 100, 100)];
    activityView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
    [self.view addSubview:activityView];
    [activityView startAnimating];
}

@end
