//
//  TableViewController.m
//  IOSBaseLearn
//
//  Created by xue on 2017/7/13.
//  Copyright © 2017年 xue. All rights reserved.
//

#import "TableViewController.h"
#import "TableViewBaseViewController.h"
#import "TableView2ViewController.h"
#import "TableViewCustomCellViewController.h"
#import "TableViewCellHeight1ViewController.h"
#import "TableViewDuoCellVC.h"
#import "TableViewHeaderVC.h"
#import "TableViewCellSameHeightVC.h"

@interface TableViewController ()

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (IBAction)gotoTableViewBase:(id)sender {
    UIViewController * vc = [[TableViewBaseViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)gotoTableView2:(id)sender {
    UIViewController * vc = [[TableView2ViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)totoTableViewCustomCell:(id)sender {
    UIViewController * vc = [[TableViewCustomCellViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)gotoSelfSizingCell:(id)sender {
    UIViewController * vc = [[TableViewCellHeight1ViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)gotoDuoCell:(id)sender {
    UIViewController * vc = [[TableViewDuoCellVC alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)gotoHeaderView:(id)sender {
    UIViewController * vc = [[TableViewHeaderVC alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)gotoCellSameHeight:(id)sender {
    UIViewController * vc = [[TableViewCellSameHeightVC alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
