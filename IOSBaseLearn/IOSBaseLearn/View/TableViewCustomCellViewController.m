//
//  TableViewCustomCellViewController.m
//  IOSBaseLearn
//
//  Created by xue on 2017/7/18.
//  Copyright © 2017年 xue. All rights reserved.
//

#import "TableViewCustomCellViewController.h"
#import "CustomTableViewCell.h"

@interface TableViewCustomCellViewController () <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) UITableView * tableView;
@end

@implementation TableViewCustomCellViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.translucent = YES;
    
    self.tableView = [[UITableView alloc]init];
    self.tableView.frame = [UIScreen mainScreen].bounds;
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
//    self.tableView.rowHeight = 50;
    
    [self.view addSubview:self.tableView];
}

#pragma mark: - delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * cellStr = @"cell";
    CustomTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellStr];
    if (cell == nil) {
        cell = [[CustomTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellStr];
    }
    NSString * text = [NSString stringWithFormat:@"item %ld", indexPath.row];
    cell.textLabel.text = text;
    cell.label.text = text;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

@end
