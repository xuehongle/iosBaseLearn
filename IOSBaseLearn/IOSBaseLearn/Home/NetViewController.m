//
//  NetViewController.m
//  IOSBaseLearn
//
//  Created by xue on 2017/8/15.
//  Copyright © 2017年 xue. All rights reserved.
//

#import "NetViewController.h"
#import "NSThreadViewController.h"
#import "NSThreadPropertyViewController.h"
#import "NSOperationViewController.h"
#import "NSURLConnectViewController.h"
#import "NSURLConnectParmViewController.h"
#import "ImageViewController.h"
#import "ImageThreadViewController.h"
#import "GCDBaseViewController.h"
#import "ImageGCDViewController.h"
#import "GCDqueueViewController.h"
#import "GCDDelayViewController.h"
#import "GCDGroupViewController.h"
#import "NSOperation2ViewController.h"
#import "ImageSyncViewController.h"
#import "ImageAsyncViewController.h"
#import "ImageErrorLineViewController.h"
#import "ImageRepeatDownloadViewController.h"
#import "ImageRefactoringViewController.h"
#import "ImageCacheViewController.h"
#import "NSOperation3ViewController.h"
#import "ImageCustomViewController.h"
#import "ImageSDViewController.h"
#import "ImageCategoryViewController.h"
#import "ImageEnumViewController.h"
#import "DictionaryModelViewController.h"

@interface NetViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSArray * all;
@property (nonatomic, strong) NSArray * listGroupName;

@end

@implementation NetViewController

- (void)viewDidLoad {
    NSLog(@"%s", __FUNCTION__);
    [super viewDidLoad];
    
    self.navigationItem.title = @"多线程和网络";
    
    NSArray *arrThread = [NSArray arrayWithObjects:@"NSThread创建", @"NSThread常用属性", @"GCD基本使用", @"GCD串行和并发队列", @"GCD延时和一次性执行", @"GCD调度组", @"NSOperation基本使用", @"NSOperation高级使用", @"自定义NSOpeation", nil];
    NSArray *arrNet = [NSArray arrayWithObjects:@"NSURLConnect", @"NSURLConnection参数", @"字典转模型", nil];
    NSArray *arrImg = [NSArray arrayWithObjects:@"加载网络图片单线程", @"加载网络图片多线程", @"加载网络图片GCD", @"列表同步显示图片", @"列表异步显示图片", @"列表异步显示图片_错行和重新下载", @"列表异步显示图片_下载操作重复", @"列表异步显示图片_重构", @"列表异步显示图片_使用图像缓存", @"自定义ImageView加载图像", @"SDWebImage", @"模仿SDWebImage分类加参数实现", @"模仿SDWebImageManager学习位移枚举", nil];
    self.all = [NSMutableArray arrayWithObjects:arrThread, arrNet, arrImg, nil];
    
    self.listGroupName = @[@"多线程",@"网络",@"图片"];
    
    CGRect rect =  [UIScreen mainScreen].bounds;
//    plain和group的区别，plain会显示悬浮的标题
    UITableView * tableView = [[UITableView alloc]initWithFrame:rect style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    
    tableView.sectionIndexColor = [UIColor redColor]; // 索引文字颜色
    tableView.sectionIndexBackgroundColor = [UIColor blueColor]; //索引背景色
}

- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"%s", __FUNCTION__);
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
    NSLog(@"%s", __FUNCTION__);
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    NSLog(@"%s", __FUNCTION__);
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
    NSLog(@"%s", __FUNCTION__);
    [super viewDidDisappear:animated];
}

#pragma mark: - delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.all.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *arr = self.all[section];
    return arr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * cellStr = @"cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellStr];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellStr];
    }
    
    NSArray *arr = self.all[indexPath.section];
    cell.textLabel.text = arr[indexPath.row];
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return self.listGroupName[section];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UIViewController * vc = nil;
    NSArray *arr = self.all[indexPath.section];
    if (indexPath.section == 0) {
        if ([arr[indexPath.row] isEqualToString:@"NSThread创建"]) {
            vc = [[NSThreadViewController alloc]init];
        } else if ([arr[indexPath.row] isEqualToString:@"NSThread常用属性"]) {
            vc = [[NSThreadPropertyViewController alloc]init];
        } else if ([arr[indexPath.row] isEqualToString:@"GCD基本使用"]) {
            vc = [[GCDBaseViewController alloc]init];
        } else if ([arr[indexPath.row] isEqualToString:@"GCD串行和并发队列"]) {
            vc = [[GCDqueueViewController alloc]init];
        } else if ([arr[indexPath.row] isEqualToString:@"GCD延时和一次性执行"]) {
            vc = [[GCDDelayViewController alloc]init];
        } else if ([arr[indexPath.row] isEqualToString:@"GCD调度组"]) {
            vc = [[GCDGroupViewController alloc]init];
        } else if ([arr[indexPath.row] isEqualToString:@"NSOperation基本使用"]) {
            vc = [[NSOperationViewController alloc]init];
        } else if ([arr[indexPath.row] isEqualToString:@"NSOperation高级使用"]) {
            vc = [[NSOperation2ViewController alloc]init];
        } else if ([arr[indexPath.row] isEqualToString:@"自定义NSOpeation"]) {
            vc = [[NSOperation3ViewController alloc]init];
        }
    } else if (indexPath.section == 1) {
        if ([arr[indexPath.row] isEqualToString:@"NSURLConnect"]) {
            vc = [[NSURLConnectViewController alloc]init];
        } else if ([arr[indexPath.row] isEqualToString:@"NSURLConnection参数"]) {
            vc = [[NSURLConnectParmViewController alloc]init];
        } else if ([arr[indexPath.row] isEqualToString:@"字典转模型"]) {
            vc = [[DictionaryModelViewController alloc]init];
        }
    } else if (indexPath.section == 2) {
        if ([arr[indexPath.row] isEqualToString:@"加载网络图片单线程"]) {
            vc = [[ImageViewController alloc]init];
        } else if ([arr[indexPath.row] isEqualToString:@"加载网络图片多线程"]) {
            vc = [[ImageThreadViewController alloc]init];
        } else if ([arr[indexPath.row] isEqualToString:@"加载网络图片GCD"]) {
            vc = [[ImageGCDViewController alloc]init];
        } else if ([arr[indexPath.row] isEqualToString:@"列表同步显示图片"]) {
            vc = [[ImageSyncViewController alloc]init];
        } else if ([arr[indexPath.row] isEqualToString:@"列表异步显示图片"]) {
            vc = [[ImageAsyncViewController alloc]init];
        } else if ([arr[indexPath.row] isEqualToString:@"列表异步显示图片_错行和重新下载"]) {
            vc = [[ImageErrorLineViewController alloc]init];
        } else if ([arr[indexPath.row] isEqualToString:@"列表异步显示图片_下载操作重复"]) {
            vc = [[ImageRepeatDownloadViewController alloc]init];
        } else if ([arr[indexPath.row] isEqualToString:@"列表异步显示图片_重构"]) {
            vc = [[ImageRefactoringViewController alloc]init];
        } else if ([arr[indexPath.row] isEqualToString:@"列表异步显示图片_使用图像缓存"]) {
            vc = [[ImageCacheViewController alloc]init];
        } else if ([arr[indexPath.row] isEqualToString:@"自定义ImageView加载图像"]) {
            vc = [[ImageCustomViewController alloc]init];
        } else if ([arr[indexPath.row] isEqualToString:@"SDWebImage"]) {
            vc = [[ImageSDViewController alloc]init];
        } else if ([arr[indexPath.row] isEqualToString:@"模仿SDWebImage分类加参数实现"]) {
            vc = [[ImageCategoryViewController alloc]init];
        } else if ([arr[indexPath.row] isEqualToString:@"模仿SDWebImageManager学习位移枚举"]) {
            vc = [[ImageEnumViewController alloc]init];
        }
    }
    [self.navigationController pushViewController:vc animated:YES];
}

- (NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    NSMutableArray *listTitles = [[NSMutableArray alloc]initWithCapacity:self.listGroupName.count];
    for (NSString *item in self.listGroupName) {
        NSString *title = [item substringToIndex:1];
        [listTitles addObject:title];
    }
    
    return listTitles;
}

@end
