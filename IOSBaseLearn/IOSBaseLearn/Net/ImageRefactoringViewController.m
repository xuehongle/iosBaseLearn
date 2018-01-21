//
//  ImageRefactoringViewController.m
//  IOSBaseLearn
//
//  Created by 薛乐 on 2017/8/20.
//  Copyright © 2017年 xue. All rights reserved.
//

#import "ImageRefactoringViewController.h"
#import "CZAppInfo.h"

@interface ImageRefactoringViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *appList;
@property (nonatomic, strong) NSOperationQueue *opQueue;
@property (nonatomic, strong) NSMutableDictionary *operationsCache;

@end

@implementation ImageRefactoringViewController

- (NSMutableDictionary *)operationsCache {
    if (_operationsCache == nil) {
        _operationsCache = [[NSMutableDictionary alloc] init];
    }
    return _operationsCache;
}

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
 
 4. 隐晦的问题：如果某一张图片下载很慢，用户来回滚动，会造成重复创建下载操作！造成不必要的浪费！
 
 如何解决 - 下载操作缓冲池
 
 在下载之前，判断缓冲池中是否已经存在下载操作？
 如果存在，就不下载
 如果不存在，就下载！
 
 新问题：如何做"缓冲池" -> 容器，能够存放多个对象的！
 
 - 数组：按照下标，可以通过 indexPath 可以判断操作是否已经在进行中...
 举个栗子：表格应用都有下拉刷新和上拉刷新！一旦拉，indexPath 就变化了，就不要定位下载操作了！
 
 - 字典：按照key，可以通过下载图像的 URL(唯一定位网络资源的字符串)
 举个栗子：网易新闻，有一张图片，即出现在头条中，又出现在八卦中。
 需要下载一次就可以了，因为URL是唯一的！
 
 - [不合适]NSSet -> 无序的 AnyObject，目前的需求，需要能够拿到准确下载某一个图片的操作！
 
 小结：选择缓冲池，一定要分析清楚使用需求，根据需求来决定！
 
 5. 下载完成之后，应该从缓冲池中，删除下载操作，否则会造成内存浪费！
 
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
    
    if (app.image != nil) {
        NSLog(@"真的没有下载！！！");
        cell.imageView.image = app.image;
    } else {
        
        cell.imageView.image = [UIImage imageNamed:@"user_default"];
        
        [self downloadImage:indexPath];
        
    }
    NSLog(@"操作数量- %tu", self.opQueue.operationCount);
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%@", self.operationsCache);
}

- (void)downloadImage:(NSIndexPath *)indexPath {
    
    CZAppInfo *app = self.appList[indexPath.row];
    
    // 判断下载操作是否已经存在
    if (self.operationsCache[app.icon]) {
        NSLog(@"正在玩命下载中....稍安勿躁！");
    } else {
        NSBlockOperation * op = [NSBlockOperation blockOperationWithBlock:^{
            
            // 模拟网络延时
            NSLog(@"下载图像 %@", app.name);
            
            // 第一行很慢
            if (indexPath.row == 0) {
                [NSThread sleepForTimeInterval:10.0];
            }
            
            NSURL * url = [NSURL URLWithString:app.icon];
            NSData * data = [NSData dataWithContentsOfURL:url];
            UIImage * image = [UIImage imageWithData:data];
            
            // 下载完成之后，将操作从缓冲池中删除，释放内存！
            [self.operationsCache removeObjectForKey:app.icon];
            
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                app.image = image;
                [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
            }];
        }];
        
        // 将下载操作添加到缓冲池，使用 URL 作为 key
        [self.operationsCache setObject:op forKey:app.icon];
        
        [self.opQueue addOperation:op];
    }
}

@end
