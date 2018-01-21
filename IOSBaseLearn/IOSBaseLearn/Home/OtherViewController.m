//
//  OtherViewController.m
//  IOSBaseLearn
//
//  Created by xue on 2017/7/20.
//  Copyright © 2017年 xue. All rights reserved.
//

#import "OtherViewController.h"
#import "LayoutViewController.h"
#import "AutoResizingViewController.h"
#import "NSUserDefaultViewController.h"
#import "NSThreadViewController.h"
#import "NSOperationViewController.h"
#import "AutoLayoutXibViewController.h"
#import "AutoLayoutCodeViewController.h"
#import "AutoLayoutAnimateViewController.h"
#import "UIApplicationViewController.h"
#import "SavePlistViewController.h"
#import "NSKeyedArchiverViewController.h"
#import "ModalViewController.h"
#import "Quartz2DViewController.h"
#import "CALayerViewController.h"
#import "CALayerAnimViewController.h"
#import "CAAnimBaseViewController.h"
#import "CAAnimKeyframeViewController.h"
#import "CAAnimTransitionViewController.h"
#import "CAAnimGroupViewController.h"
#import "UIViewAnimationViewController.h"
#import "CATransitionViewController.h"
#import "ImageStretchingViewController.h"
#import "ImageSlicingViewController.h"
#import "Block1ViewController.h"
#import "MasonryViewController.h"
#import "PushLocalViewController.h"
#import "UIDynamicViewController.h"
#import "SizeClassViewController.h"
#import "LocalAuthenticationViewController.h"
#import "UIImageViewAnimViewController.h"

@interface OtherViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSArray * all;
@property (nonatomic, strong) NSArray * arr;
@property (nonatomic, strong) NSArray * arrSave;
@property (nonatomic, strong) NSArray * arrOther;
@property (nonatomic, strong) NSArray * arrCoreAnim;
@end

@implementation OtherViewController

- (void)viewDidLoad {
    NSLog(@"%s", __FUNCTION__);
    [super viewDidLoad];
    
    self.navigationItem.title = @"OtherThings";
    
    self.arr = [NSArray arrayWithObjects:@"手动布局子视图", @"AutoResizing", @"AutoLayout-xib", @"AutoLayout-code", @"AutoLayout-动画", @"Masonry", @"SizeClasses", nil];
    self.arrSave = [NSArray arrayWithObjects:@"NSUserDefault", @"Plist", @"NSKeyedArchiver归档", nil];
    self.arrCoreAnim = [NSArray arrayWithObjects:@"基本动画", @"关键帧动画", @"转场动画", @"组动画", @"UIView动画", @"导航控制器动画", @"UIDynamic物理仿真器", @"UIImageView帧动画", nil];
    self.arrOther = [NSArray arrayWithObjects:@"UIApplication", @"Modal模态", @"Quartz2D绘制", @"CALayer", @"CALayer隐式动画", @"图片拉伸Stretching", @"图片拉伸Slicing", @"block的反向传值", @"push本地", @"指纹识别",nil];
    self.all = [NSMutableArray arrayWithObjects:self.arr, self.arrSave, self.arrCoreAnim, self.arrOther, nil];
    
    CGRect rect =  [UIScreen mainScreen].bounds;
    UITableView * tableView = [[UITableView alloc]initWithFrame:rect style:UITableViewStyleGrouped];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    
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
    NSArray * arr = self.all[section];
    return arr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * cellStr = @"cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellStr];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellStr];
    }
    NSArray * arr = self.all[indexPath.section];
    cell.textLabel.text = arr[indexPath.row];

    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return @"适配";
            break;
        case 1:
            return @"存储";
            break;
        case 2:
            return @"核心动画 和 其他动画";
            break;
        case 3:
            return @"其他";
            break;
            
        default:
            return nil;
            break;
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    UIViewController * vc = nil;
    if (indexPath.section == 0) {
        if ([self.arr[indexPath.row] isEqualToString:@"手动布局子视图"]) {
            vc = [[LayoutViewController alloc]init];
        } else if ([self.arr[indexPath.row] isEqualToString:@"AutoResizing"]) {
            vc = [[AutoResizingViewController alloc]init];
        } else if ([self.arr[indexPath.row] isEqualToString:@"AutoLayout-xib"]) {
            vc = [[AutoLayoutXibViewController alloc]init];
        } else if ([self.arr[indexPath.row] isEqualToString:@"AutoLayout-code"]) {
            vc = [[AutoLayoutCodeViewController alloc]init];
        } else if ([self.arr[indexPath.row] isEqualToString:@"AutoLayout-动画"]) {
            vc = [[AutoLayoutAnimateViewController alloc]init];
        } else if ([self.arr[indexPath.row] isEqualToString:@"Masonry"]) {
            vc = [[MasonryViewController alloc]init];
        } else if ([self.arr[indexPath.row] isEqualToString:@"SizeClasses"]) {
            vc = [[SizeClassViewController alloc]init];
        }
    } else if (indexPath.section == 1) {
        if ([self.arrSave[indexPath.row] isEqualToString:@"NSUserDefault"]) {
            vc = [[NSUserDefaultViewController alloc]init];
        } else if ([self.arrSave[indexPath.row] isEqualToString:@"Plist"]) {
            vc = [[SavePlistViewController alloc]init];
        } else if ([self.arrSave[indexPath.row] isEqualToString:@"NSKeyedArchiver归档"]) {
            vc = [[NSKeyedArchiverViewController alloc]init];
        }
    } else if (indexPath.section == 2) {
        if ([self.arrCoreAnim[indexPath.row] isEqualToString:@"基本动画"]) {
            vc = [[CAAnimBaseViewController alloc]init];
        } else if ([self.arrCoreAnim[indexPath.row] isEqualToString:@"关键帧动画"]) {
            vc = [[CAAnimKeyframeViewController alloc]init];
        } else if ([self.arrCoreAnim[indexPath.row] isEqualToString:@"转场动画"]) {
            vc = [[CAAnimTransitionViewController alloc]init];
        } else if ([self.arrCoreAnim[indexPath.row] isEqualToString:@"组动画"]) {
            vc = [[CAAnimGroupViewController alloc]init];
        } else if ([self.arrCoreAnim[indexPath.row] isEqualToString:@"UIView动画"]) {
            vc = [[UIViewAnimationViewController alloc]init];
        } else if ([self.arrCoreAnim[indexPath.row] isEqualToString:@"导航控制器动画"]) {
            vc = [[CATransitionViewController alloc]init];
        } else if ([self.arrCoreAnim[indexPath.row] isEqualToString:@"UIDynamic物理仿真器"]) {
            vc = [[UIDynamicViewController alloc]initWithNibName:@"UIDynamicViewController" bundle:nil];
        } else if ([self.arrCoreAnim[indexPath.row] isEqualToString:@"UIImageView帧动画"]) {
            vc = [[UIImageViewAnimViewController alloc]initWithNibName:@"UIImageViewAnimViewController" bundle:nil];
        }
    } else if (indexPath.section == 3) {
        if ([self.arrOther[indexPath.row] isEqualToString:@"UIApplication"]) {
            // TODO X 为啥不用nibName加载不出了呢
            vc = [[UIApplicationViewController alloc]initWithNibName:@"UIApplicationViewController" bundle:nil];
        } else if ([self.arrOther[indexPath.row] isEqualToString:@"Modal模态"]) {
            UIViewController * modalVc = [[ModalViewController alloc]init];
            UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:modalVc];
            [self presentViewController:nav animated:YES completion:^{
                NSLog(@"弹出modal视图");
            }];
            return;
        } else if ([self.arrOther[indexPath.row] isEqualToString:@"Quartz2D绘制"]) {
            vc = [[Quartz2DViewController alloc]init];
        } else if ([self.arrOther[indexPath.row] isEqualToString:@"CALayer"]) {
            vc = [[CALayerViewController alloc]init];
        } else if ([self.arrOther[indexPath.row] isEqualToString:@"CALayer隐式动画"]) {
            vc = [[CALayerAnimViewController alloc]init];
        } else if ([self.arrOther[indexPath.row] isEqualToString:@"图片拉伸Stretching"]) {
            vc = [[ImageStretchingViewController alloc]init];
        } else if ([self.arrOther[indexPath.row] isEqualToString:@"图片拉伸Slicing"]) {
            vc = [[ImageSlicingViewController alloc]init];
        } else if ([self.arrOther[indexPath.row] isEqualToString:@"block的反向传值"]) {
            vc = [[Block1ViewController alloc]init];
        } else if ([self.arrOther[indexPath.row] isEqualToString:@"push本地"]) {
            vc = [[PushLocalViewController alloc]init];
        } else if ([self.arrOther[indexPath.row] isEqualToString:@"指纹识别"]) {
            vc = [[LocalAuthenticationViewController alloc]init];
        }
    }
    
    [self.navigationController pushViewController:vc animated:YES];
}

@end
