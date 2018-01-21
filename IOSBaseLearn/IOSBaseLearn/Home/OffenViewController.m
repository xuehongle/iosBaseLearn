//
//  OffenViewController.m
//  IOSBaseLearn
//
//  Created by 薛乐 on 2018/1/2.
//  Copyright © 2018年 xue. All rights reserved.
//

#import "OffenViewController.h"
#import "CustomViewVC.h"

@interface OffenViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray * arr;

@end

@implementation OffenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"常用";
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    _arr = @[@"跳转AppStroe", @"自定义View"];
}

//pragma: delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _arr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * cellID = @"cellId";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.text = _arr[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.arr[indexPath.row] isEqualToString:@"跳转AppStroe"]) {
        // 只在真机有效，因为模拟器没appstore, 会跳转到网页, 有汉字不可以, 汉字改成拼音
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://itunes.apple.com/cn/app/zhihuinanzhan/id1195757626?mt=8"]];
    } else if ([self.arr[indexPath.row] isEqualToString:@"自定义View"]) {
        CustomViewVC * vc = [[CustomViewVC alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}
@end
