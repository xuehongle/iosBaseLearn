//
//  TableView2ViewController.m
//  IOSBaseLearn
//
//  Created by xue on 2017/7/13.
//  Copyright © 2017年 xue. All rights reserved.
//

#import "TableView2ViewController.h"

@interface TableView2ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView * tableView;
@property (nonatomic, strong) NSMutableArray * arr;
@property (nonatomic, strong) UIBarButtonItem * btnEdit;
@property (nonatomic, strong) UIBarButtonItem * btnFinish;
@property (nonatomic, strong) UIBarButtonItem * btnDelete;
@end

@implementation TableView2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tableView = [[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
    _tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    _tableView.tableHeaderView = nil;
    _tableView.tableFooterView = nil;
    
    [self.view addSubview:_tableView];
    
    _arr = [[NSMutableArray alloc]init];
    
    for (int i=0; i<20; i++) {
        NSString * str = [NSString stringWithFormat:@"A %d", i];
        [_arr addObject:str];
    }
    [_tableView reloadData];
    
    [self createBtn];
}

- (void) createBtn {
    self.btnEdit = [[UIBarButtonItem alloc]initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(editClick)];
    self.btnFinish = [[UIBarButtonItem alloc]initWithTitle:@"完成" style:UIBarButtonItemStyleDone target:self action:@selector(finishClick)];
    self.btnDelete = [[UIBarButtonItem alloc]initWithTitle:@"删除" style:UIBarButtonItemStylePlain target:self action:@selector(deleteClick)];
    self.navigationItem.rightBarButtonItem = self.btnEdit;
    
}

- (void) editClick {
    self.navigationItem.rightBarButtonItem = self.btnFinish;
    [_tableView setEditing:YES animated:YES];
    self.navigationItem.leftBarButtonItem = self.btnDelete;
}

- (void) finishClick {
    self.navigationItem.rightBarButtonItem = self.btnEdit;
    [_tableView setEditing:NO animated:YES];
    self.navigationItem.leftBarButtonItem = nil;
}

- (void) deleteClick {
    
}

#pragma mark: - delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _arr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString * cellStr = @"ID";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellStr];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellStr];
    }
    cell.textLabel.text = _arr[indexPath.row];
    return cell;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleDelete ; //默认是删除状态
}

// 写了这个方法后，手指在cell滑动的时候，会出现删除状态
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.arr removeObjectAtIndex:indexPath.row];
    [_tableView reloadData];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"选中%ld", indexPath.row);
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"取消%ld", indexPath.row);
}

@end
