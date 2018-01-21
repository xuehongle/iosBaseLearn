//
//  ImageAsyncViewController.m
//  IOSBaseLearn
//
//  Created by 薛乐 on 2017/8/20.
//  Copyright © 2017年 xue. All rights reserved.
//

#import "ImageAsyncViewController.h"
#import "CZAppInfo.h"

@interface ImageAsyncViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
/**
 *  应用程序列表数组
 */
@property (nonatomic, strong) NSArray *appList;

@property (nonatomic, strong) NSOperationQueue *opQueue;

@end

@implementation ImageAsyncViewController

- (NSOperationQueue *)opQueue {
    if (_opQueue == nil) {
        _opQueue = [[NSOperationQueue alloc] init];
    }
    return _opQueue;
}

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
    // 显示占位图像，初次加载的图片显示大小会和占位图像大小一致
    // 解决办法：自定义cell，所有地控件大小，都是预先指定好的，不需要利用占位图像去填充大小
    cell.imageView.image = [UIImage imageNamed:@"user_default"];
    
    NSBlockOperation * op = [NSBlockOperation blockOperationWithBlock:^{
        // 模拟网络延时
        NSLog(@"下载图像 %@ %@", app.name, [NSThread currentThread]);
        
        // 后面地cell地图片下载速度会延迟
        if (indexPath.row > 9) {
            [NSThread sleepForTimeInterval:2.0];
        }
        // 从网络上下载图片，网络上传输的数据都是二进制的
        NSURL * url = [NSURL URLWithString:app.icon];
        NSData * data = [NSData dataWithContentsOfURL:url];
        UIImage * image = [UIImage imageWithData:data];
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            cell.imageView.image = image;
        }];
    }];
    [self.opQueue addOperation:op];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

@end
