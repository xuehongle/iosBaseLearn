//
//  TableViewHeaderVC.m
//  IOSBaseLearn
//
//  Created by 薛乐 on 2018/1/6.
//  Copyright © 2018年 xue. All rights reserved.
//

#import "TableViewHeaderVC.h"
#import "CustomView.h"
#import "TableViewDuo0Cell.h"

@interface TableViewHeaderVC () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView * tableView;
@property (nonatomic, strong) NSArray * arr;
@end

@implementation TableViewHeaderVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.arr = @[@"a123",@"b123",@"a123",@"a123",@"a123",@"b123",@"a123",@"b123",@"a123",@"b123",@"a123",@"a123",@"b123",@"b123",@"a123",@"a123"];
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-64) style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
    [self.tableView registerNib:[UINib nibWithNibName:@"TableViewDuo0Cell" bundle:nil] forCellReuseIdentifier:@"TableViewDuo0Cell"];
    CustomView *customView = [[[NSBundle mainBundle]loadNibNamed:@"CustomView" owner:nil options:nil]lastObject];
    customView.labelTitle.text = @"啊哈哦啊哦啊啊哈哦啊哦啊啊哈哦啊哦啊啊哈哦啊哦啊啊哈哦啊哦啊啊哈哦啊哦啊啊哈哦啊哦啊啊哈哦啊哦啊啊哈哦啊哦啊啊哈哦啊哦啊啊哈哦啊哦啊啊哈哦啊哦啊啊哈哦啊哦啊啊哈哦啊哦啊啊哈哦啊哦啊啊哈哦啊哦啊啊哈哦啊哦啊啊哈哦啊哦啊啊哈哦啊哦啊啊哈哦啊哦啊啊哈哦啊哦啊啊哈哦啊哦啊啊哈哦啊哦啊啊哈哦啊哦啊123";
    customView.labelTitle.numberOfLines = 0;
    
    // 动态改变高度
    CGSize size =  [customView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    customView.frame = CGRectMake(0, 0, size.width, size.height);

    self.tableView.tableHeaderView = customView;
    // masonry改高度也可以
//    [customView remakeConstraints:^(MASConstraintMaker *make) {
//        make.left.right.top.equalTo(customView);
//        make.height.equalTo(size.height);
//    }];
//    [self.tableView layoutIfNeeded];
    
}

#pragma mark: - delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewDuo0Cell * cell = [tableView dequeueReusableCellWithIdentifier:@"TableViewDuo0Cell" forIndexPath:indexPath];
    cell.labelTitle.text = [NSString stringWithFormat:@"label%ld", (long)indexPath.row];
    return cell;
}
@end
