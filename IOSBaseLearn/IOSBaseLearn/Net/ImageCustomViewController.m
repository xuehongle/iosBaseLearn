//
//  ImageCustomViewController.m
//  IOSBaseLearn
//
//  Created by xue on 2017/8/28.
//  Copyright © 2017年 xue. All rights reserved.
//

#import "ImageCustomViewController.h"
#import "CZAppInfo.h"
#import "CZAppCell.h"
#import "CZDownloadImageManager.h"

@interface ImageCustomViewController () <UITableViewDelegate, UITableViewDataSource>
/**
 *  应用程序列表数组
 */
@property (nonatomic, strong) NSArray *appList;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation ImageCustomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"CZAppCell" bundle:nil] forCellReuseIdentifier:@"CZAppCell"];
}

- (NSArray *)appList {
    if (_appList == nil) {
        NSURL *url = [[NSBundle mainBundle] URLForResource:@"apps.plist" withExtension:nil];
        NSArray *array = [NSArray arrayWithContentsOfURL:url];
        
        NSMutableArray *arrayM = [NSMutableArray arrayWithCapacity:array.count];
        
        // enumerateObjectsUsingBlock的效率比for in要快
        [array enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            [arrayM addObject:[CZAppInfo appInfoWithDict:obj]];
        }];
        _appList = arrayM;
    }
    return _appList;
}

#pragma mark - 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.appList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CZAppCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CZAppCell"];
    
    // 设置 Cell...
    cell.appInfo = self.appList[indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    // 清理内存工作 - 当 NSOperationQueue 取消任务时，会给队列中的所有任务发送 cancel 消息
    // 如果是自定义的操作，同样能够被取消掉
    [[CZDownloadImageManager sharedDownloadImageManager] clearMemory];
}



@end
