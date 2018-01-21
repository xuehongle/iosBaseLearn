//
//  TableViewDuoCellVC.m
//  IOSBaseLearn
//
//  Created by 薛乐 on 2018/1/6.
//  Copyright © 2018年 xue. All rights reserved.
//

#import "TableViewDuoCellVC.h"

@interface TableViewDuoCellVC ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView * tableView;
@property (nonatomic, strong) NSArray * arr;
@end

@implementation TableViewDuoCellVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.arr = @[@"a123",@"b123",@"a123",@"a123",@"a123",@"b123",@"a123",@"b123",@"a123",@"b123",@"a123",@"a123",@"b123",@"b123",@"a123",@"a123"];
    self.tableView = [[UITableView alloc]init];
    self.tableView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight - 64);
    [self.view addSubview:self.tableView];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.estimatedRowHeight = 100;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    [self.tableView registerNib:[UINib nibWithNibName:@"TableViewDuo0Cell" bundle:nil] forCellReuseIdentifier:@"TableViewDuo0Cell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"TableViewDuo1Cell" bundle:nil] forCellReuseIdentifier:@"TableViewDuo1Cell"];
}

#pragma delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString * str = self.arr[indexPath.row];
    UITableViewCell * cell;
    if ([str hasPrefix:@"a"]) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"TableViewDuo0Cell" forIndexPath:indexPath];
    } else {
        cell = [tableView dequeueReusableCellWithIdentifier:@"TableViewDuo1Cell" forIndexPath:indexPath];
    }
    return cell;
}
@end
