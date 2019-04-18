//
//  TableViewCellSameHeightVC.m
//  IOSBaseLearn
//
//  Created by xue on 2019/4/18.
//  Copyright © 2019 xue. All rights reserved.
//

#import "TableViewCellSameHeightVC.h"
#import "XMGTgCell.h"
#import "XMGTg.h"
#import "MJExtension.h"

@interface TableViewCellSameHeightVC ()

/** 所有的团购数据 */
@property (nonatomic, strong) NSArray *tgs;

@end

@implementation TableViewCellSameHeightVC

- (NSArray *)tgs
{
    if (!_tgs) {
        
        //        NSArray *dictArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"tgs.plist" ofType:nil]];
        
        //        NSMutableArray *temp = [NSMutableArray array];
        //        for (NSDictionary *tgDict in dictArray) {
        //            [temp addObject:[XMGTg tgWithDict:tgDict]];
        //        }
        
        
        
        //        _tgs = [XMGTg mj_objectArrayWithKeyValuesArray:dictArray];
        //        _tgs = [XMGTg mj_objectArrayWithFile:[[NSBundle mainBundle] pathForResource:@"tgs.plist" ofType:nil]];
        
        _tgs = [XMGTg mj_objectArrayWithFilename:@"tgs.plist"];
    }
    return _tgs;
}

NSString *ID = @"tg";
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.rowHeight = 70;
    
    // 根据ID 注册 对应的cell类型 为XMGTgCell
    [self.tableView registerClass:[XMGTgCell class] forCellReuseIdentifier:ID];
}

#pragma mark - 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.tgs.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 访问缓存池
    XMGTgCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    // 设置数据(传递模型)
    cell.tg = self.tgs[indexPath.row];
    
    return cell;
}

@end
