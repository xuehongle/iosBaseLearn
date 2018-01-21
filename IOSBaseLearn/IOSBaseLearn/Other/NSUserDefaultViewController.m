//
//  NSUserDefaultViewController.m
//  IOSBaseLearn
//
//  Created by 薛乐 on 2017/7/12.
//  Copyright © 2017年 xue. All rights reserved.
//

#import "NSUserDefaultViewController.h"

@interface NSUserDefaultViewController ()

@end

@implementation NSUserDefaultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //存储在沙盒Library/Preferences/com.xue.IOSBaseLearn.plist
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
    
    UIButton * btnDelete = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btnDelete.frame = CGRectMake(10, 150, 50, 30);
    [btnDelete setTitle:@"删" forState:UIControlStateNormal];
    [btnDelete addTarget:self action:@selector(delete) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnDelete];
}

- (void) write {
    NSUserDefaults * userDefault = [NSUserDefaults standardUserDefaults];
    [userDefault setObject:@"ethan" forKey:@"NAME"];
    NSNumber * num = [NSNumber numberWithInt:12];
    [userDefault setObject:num forKey:@"NUM"];
    [userDefault setInteger:123 forKey:@"INT"];
    [userDefault setBool:false forKey:@"BOOL"];
    [userDefault setFloat:1.2 forKey:@"Float"];
    NSArray * arr = [NSArray arrayWithObjects:@"11", @"22", @"33", nil];
    [userDefault setObject:arr forKey:@"ARRAY"];
    //userDefault不会立刻存，会在未来的某个时间点保存，所以需要同步
    [userDefault synchronize];
}

- (void) read {
    NSUserDefaults * userDefault = [NSUserDefaults standardUserDefaults];
    id object = [userDefault objectForKey:@"NAME"];
    NSLog(@"NAME %@", (NSString *)object);
    NSLog(@"NUM %@", [userDefault objectForKey:@"NUM"]);
    NSLog(@"INT %ld", (long)[userDefault integerForKey:@"INT"]);
    NSLog(@"BOOL %d", [userDefault boolForKey:@"BOOL"]);
    NSLog(@"Float %f", [userDefault floatForKey:@"Float"]);
    NSLog(@"ARRAY %@", [userDefault objectForKey:@"ARRAY"]);
}

- (void) delete {
    NSUserDefaults * userDefault = [NSUserDefaults standardUserDefaults];
    [userDefault removeObjectForKey:@"NAME"];
    [userDefault removeObjectForKey:@"NUM"];
    [userDefault removeObjectForKey:@"INT"];
    [userDefault removeObjectForKey:@"BOOL"];
    [userDefault removeObjectForKey:@"Float"];
    [userDefault removeObjectForKey:@"ARRAY"];
}

@end
