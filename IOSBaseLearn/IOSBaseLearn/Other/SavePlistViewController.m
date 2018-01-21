//
//  SavePlistViewController.m
//  IOSBaseLearn
//
//  Created by xue on 2017/7/26.
//  Copyright © 2017年 xue. All rights reserved.
//

#import "SavePlistViewController.h"

@interface SavePlistViewController ()

@end

@implementation SavePlistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton * btnWrite = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btnWrite.frame = CGRectMake(10, 70, 50, 30);
    [btnWrite setTitle:@"写" forState:UIControlStateNormal];
    [btnWrite addTarget:self action:@selector(write) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnWrite];
    
    UIButton * btnRead = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btnRead.frame = CGRectMake(10, 110, 50, 30);
    [btnRead setTitle:@"读" forState:UIControlStateNormal];
    [btnRead addTarget:self action:@selector(read) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnRead];
}

- (void) write {
    NSString *home = NSHomeDirectory();
    NSLog(@"沙盒的目录: %@", home);
    // 不建议Documents写死
    //    NSString *path = [home stringByAppendingPathComponent:@"Documents"];
    NSString *doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *path = [doc stringByAppendingPathComponent:@"abc.plist"];
    NSDictionary *dict = @{@"name": @"xue", @"age":@"28"};
    [dict writeToFile:path atomically:YES];

}

- (void) read {

    NSString *doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *path = [doc stringByAppendingPathComponent:@"abc.plist"];
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:path];
    NSLog(@"dict=%@", dict);
}


@end
