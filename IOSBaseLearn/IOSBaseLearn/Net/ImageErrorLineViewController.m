//
//  ImageErrorLineViewController.m
//  IOSBaseLearn
//
//  Created by 薛乐 on 2017/8/20.
//  Copyright © 2017年 xue. All rights reserved.
//

#import "ImageErrorLineViewController.h"
#import "CZAppInfo.h"

@interface ImageErrorLineViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *appList;
@property (nonatomic, strong) NSOperationQueue *opQueue;

@end

@implementation ImageErrorLineViewController

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
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

#pragma mark: - delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.appList.count;
}
/**
 1. 同步加载网络图片，存在的问题：
 - 如果网速慢，会卡爆了！影响用户体验
 - 每一次滚动表格，都会重复下载图像，造成用户经济上的损失！
 
 解决问题：网速慢
 解决办法：异步下载图片
 
 2. 异步加载图片，由于没有指定图片的初始大小，图片下载完成后无法显示！
 
 解决问题：使用占位图像，提前把位置大小占出来！下次再指定图像的时候，就可以直接显示了！
 
 3. 如果下载各个图片地速度不一样，同时用户快速来回滚动表格，会造成图片地错行！
 
 解决思路：串行/加判断/下载图像的操作和cell不固定，cell会被重用...
 概念：C控制器 让V视图 显示 M模型
 问题的根源： C －> Cell 显示 "图像"，并没有跟 模型建立关系
 解决办法：利用MVC，通过模型来刷新表格
 
 1> 模型需要记录图像
 2> 下载完成之后设置模型，之后刷新表格！
 
 顺带解决了经济损失！
 
 *** 关于 MVC，最常出现的问题就是想用控制器直接操作view的显示！开发中，经常会忽略模型！会让代码非常难改！
 
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * cellStr = @"identify";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellStr];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellStr];
    }
    CZAppInfo * app = self.appList[indexPath.row];
    cell.textLabel.text = app.name;
    cell.detailTextLabel.text = app.download;
    // 判断模型中是否已经存在图像，如果有图像，直接显示
    if (app.image != nil) {
        NSLog(@"真的没有下载！！！");
        cell.imageView.image = app.image;
    } else {
        // 显示占位图像，异步下载
        // 显示表格图片
        // 显示占位图像，初次加载的图片显示大小会和占位图像大小一致
        // 解决办法：自定义cell，所有地控件大小，都是预先指定好的，不需要利用占位图像去填充大小
        cell.imageView.image = [UIImage imageNamed:@"user_default"];
        
        NSBlockOperation * op = [NSBlockOperation blockOperationWithBlock:^{
            
            // 模拟网络延时
            NSLog(@"下载图像 %@", app.name);
            
            // 后面地cell地图片下载速度会延迟
            if (indexPath.row > 9) {
                [NSThread sleepForTimeInterval:2.0];
            }
            
            NSURL * url = [NSURL URLWithString:app.icon];
            NSData * data = [NSData dataWithContentsOfURL:url];
            UIImage * image = [UIImage imageWithData:data];
            // 在主线程上更新UI
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                // 利用模型保存数据
                app.image = image;
                // 刷新表格的指定行
                [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
            }];
        }];
        [self.opQueue addOperation:op];
        
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

@end
