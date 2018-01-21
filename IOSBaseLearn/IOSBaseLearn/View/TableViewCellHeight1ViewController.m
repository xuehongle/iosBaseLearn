//
//  TableViewCellHeight1ViewController.m
//  IOSBaseLearn
//
//  Created by 薛乐 on 2017/11/25.
//  Copyright © 2017年 xue. All rights reserved.
//

#import "TableViewCellHeight1ViewController.h"
#import "MyTableViewCell.h"

@interface TableViewCellHeight1ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation TableViewCellHeight1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.tableView.estimatedRowHeight = 100; // 预计cell高度
    self.tableView.rowHeight = UITableViewAutomaticDimension; //自动计算高度cell
}

#pragma mark: - delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * cellStr = @"cellId";
    MyTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellStr];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"MyTableViewCell" owner:self options:nil]lastObject];
    }
    NSString * text = [NSString stringWithFormat:@"item %ld", indexPath.row];
    NSString * text1 = [NSString stringWithFormat:@"item %ld1.方法1：修改rowheight属性 self.tableView.rowHeight = 50; 缺点：高度固定 2.方法2：实现heightForRowAtIndexPath:代理方法- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath { return 100; } 缺点：高度固定 3.self-sizingios8及以后推出的", indexPath.row];
    if (indexPath.row % 2 == 0) {
        cell.label.text = text;
    } else {
        cell.label.text = text1;
    }
    return cell;
}

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return 100;
//}
@end
