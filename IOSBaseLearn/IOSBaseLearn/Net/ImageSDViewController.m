//
//  ImageSDViewController.m
//  IOSBaseLearn
//
//  Created by xue on 2017/8/29.
//  Copyright © 2017年 xue. All rights reserved.
//

#import "ImageSDViewController.h"
#import "CZAppInfo.h"
#import "UIImageView+WebCache.h"

@interface ImageSDViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *appList;

@end

@implementation ImageSDViewController

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


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * cellStr = @"identify";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellStr];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellStr];
    }
    CZAppInfo * app = self.appList[indexPath.row];
    cell.textLabel.text = app.name;
    cell.detailTextLabel.text = app.download;
    
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:app.icon] placeholderImage:[UIImage imageNamed:@"user_default"]];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

}

@end
