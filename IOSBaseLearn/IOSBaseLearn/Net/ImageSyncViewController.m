//
//  ImageSyncViewController.m
//  IOSBaseLearn
//
//  Created by 薛乐 on 2017/8/19.
//  Copyright © 2017年 xue. All rights reserved.
//

#import "ImageSyncViewController.h"
#import "CZAppInfo.h"

@interface ImageSyncViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
/**
 *  应用程序列表数组
 */
@property (nonatomic, strong) NSArray *appList;
@end
/**
 在 OC 中，凡事使用 @"xxx" 定义的字符串，都是保存在常量区
 */
@implementation ImageSyncViewController

- (NSArray *)appList {
    if (_appList == nil) {
        NSURL * url = [[NSBundle mainBundle] URLForResource:@"apps.plist" withExtension:nil];
        NSArray * arr = [NSArray arrayWithContentsOfURL:url];
        NSMutableArray * arrM = [NSMutableArray arrayWithCapacity:arr.count];
        [arr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [arrM addObject:[CZAppInfo appInfoWithDict:obj]];
        }];
        _appList = arrM;
    }
    return _appList;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
}

#pragma mark: - delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.appList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * identify = @"cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
    }
    CZAppInfo * app = self.appList[indexPath.row];
    cell.textLabel.text = app.name;
    cell.detailTextLabel.text = app.download;
    
    // 显示表格图片
    // 模拟网络延时
    NSLog(@"下载图像 %@", app.name);
    [NSThread sleepForTimeInterval:0.5];
    // 从网络上下载图片，网络上传输的数据都是二进制的
    NSURL * url = [NSURL URLWithString:app.icon];
    NSData * data = [NSData dataWithContentsOfURL:url];
    UIImage * image = [UIImage imageWithData:data];
    cell.imageView.image = image;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}



@end
