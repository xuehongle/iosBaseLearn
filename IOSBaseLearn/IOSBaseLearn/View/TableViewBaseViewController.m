//
//  TableViewBaseViewController.m
//  IOSBaseLearn
//
//  Created by xue on 2017/7/13.
//  Copyright © 2017年 xue. All rights reserved.
//

#import "TableViewBaseViewController.h"

@interface TableViewBaseViewController ()

@property (nonatomic, strong) UITableView * tableView;
@end

@implementation TableViewBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView = [[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
}

#pragma mark: - delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString * cellStr = @"cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellStr];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellStr];
    }
    NSString * str = [NSString stringWithFormat:@"第%ld组 第%ld行", indexPath.section, indexPath.row];
    cell.textLabel.text = str;
    return cell;
}

@end
