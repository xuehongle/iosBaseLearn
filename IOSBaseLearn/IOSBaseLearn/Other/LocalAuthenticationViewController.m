//
//  LocalAuthenticationViewController.m
//  IOSBaseLearn
//
//  Created by xue on 2017/9/1.
//  Copyright © 2017年 xue. All rights reserved.
//

#import "LocalAuthenticationViewController.h"
#import <LocalAuthentication/LocalAuthentication.h>

@interface LocalAuthenticationViewController ()
- (IBAction)btnClick:(id)sender;

@end

@implementation LocalAuthenticationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (IBAction)btnClick:(id)sender {
    if ([UIDevice currentDevice].systemVersion.floatValue < 8.0) {
        NSLog(@"设备太老");
        return;
    }
    
    // 1. 实例化指纹识别的上下文
    LAContext *ctx = [[LAContext alloc] init];
    
    // 2. 判断设备是否支持指纹识别
    if (![ctx canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:NULL]) {
        NSLog(@"不支持指纹");
        return;
    }
    
    NSLog(@"支持");
    // 3. 要求用户输入指纹
    [ctx evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics localizedReason:@"指纹登录或支付" reply:^(BOOL success, NSError *error) {
        NSLog(@"%d %@", success, error);
        
        // 如果输入成功，可以进行“用户登录”的操作！
        // 确认用户身份之后，后面的所有逻辑，还需要我们自己来！
        //        if (success) {
        //            [self postLogin];
        //        }
    }];
    NSLog(@"come here");
}
@end
