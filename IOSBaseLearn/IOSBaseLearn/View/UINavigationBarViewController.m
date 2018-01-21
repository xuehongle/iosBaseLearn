//
//  UINavigationBarViewController.m
//  IOSBaseLearn
//
//  Created by 薛乐 on 2017/11/20.
//  Copyright © 2017年 xue. All rights reserved.
//

#import "UINavigationBarViewController.h"

@interface FMTestModel : NSObject

@property (copy,nonatomic) NSString *title;
@property (copy,nonatomic) NSString *className;

@end

@implementation FMTestModel

@end

@interface UINavigationBarViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *dataArray;

@end

@implementation UINavigationBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置UINavigationBar的标题
    self.navigationItem.title = @"UINavigationBar使用总结";
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self loadData];
    [self.tableView reloadData];
}

- (void) loadData {
    self.dataArray = [[NSMutableArray alloc]init];
    NSString * filePath = [[NSBundle mainBundle]pathForResource:@"NavigationBarDataSource" ofType:@"plist"];
    NSArray *array = [NSArray arrayWithContentsOfFile:filePath];
    for (NSDictionary *dict in array) {
        FMTestModel *model = [[FMTestModel alloc]init];
        model.title = [dict objectForKey:@"Title"];
        model.className = [dict objectForKey:@"ClassName"];
        [self.dataArray addObject:model];
    }
}

#pragma mark -
#pragma mark .....:::::: TableView DataSource ::::::.....
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * cellIdentifier = @"CellIdentifier";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        FMTestModel *model = self.dataArray[indexPath.row];
        cell.textLabel.text = model.title;
    }
    return cell;
}

#pragma mark -
#pragma mark .....:::::: TableView Delegate ::::::.....

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    FMTestModel *model = self.dataArray[indexPath.row];
    UIViewController *vc = [[NSClassFromString(model.className) alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
