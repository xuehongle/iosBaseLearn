//
//  ViewController.m
//  IOSBaseLearn
//
//  Created by xue on 2017/7/5.
//  Copyright © 2017年 xue. All rights reserved.
//

#import "ViewController.h"
#import "UILabelViewController.h"
#import "UIButtonViewController.h"
#import "UIViewViewController.h"
#import "VCViewController.h"
#import "NSTimerViewController.h"
#import "UISwitchViewController.h"
#import "UISliderAndProgressViewController.h"
#import "UIStepperAndSegmentControlViewController.h"
#import "UIAlertAndActivityViewController.h"
#import "UITextFieldViewController.h"
#import "UIScrollViewController.h"
#import "UIScrollDelegateViewController.h"
#import "UITouchViewController.h"
#import "UIGestureViewController.h"
#import "UIGesture2ViewController.h"
#import "UIGesture3ViewController.h"
#import "NavigationViewController.h"
#import "UITabBarControllerViewController.h"
#import "UIPickerViewController.h"
#import "TableViewController.h"
#import "UITextViewViewController.h"
#import "UIWebViewViewController.h"
#import "AVAudioPlayerViewController.h"
#import "AVPlayerViewViewController.h"
#import "SearchViewController.h"
#import "UICollectionViewViewController.h"
#import "UIScrollScaleViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray * arr;
@end

@implementation ViewController


- (void)viewDidLoad {
    NSLog(@"%s", __FUNCTION__);
    [super viewDidLoad];
    self.navigationController.navigationBar.translucent = NO;
    self.title = @"View";
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    _arr = [NSArray arrayWithObjects:@"Label", @"Button", @"UIView", @"ViewController", @"NSTimer", @"UISwitch", @"UISlider和 UIProgressView", @"UIStepper和 UISegmentControl", @"UIAlertController和 UIActivity", @"TextField",
            @"ScrollView", @"ScrollView代理", @"ScrollView缩放", @"UICollectionView", @"UITouch", @"UIGesture基础", @"UIGesture高级",
            @"UIGesture扩展", @"UINavigationController", @"UITabBarController",
            @"UIPickerView", @"UITableView", @"UITextView", @"UIWebView", @"UISearchController",
            @"AVAudioPlayer", @"AVPlayerViewController", nil];
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
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * cellStr = @"cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellStr];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellStr];
    }
    cell.textLabel.text = self.arr[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIViewController * vc = nil;
    if ([self.arr[indexPath.row] isEqualToString:@"Label"]) {
        vc = [[UILabelViewController alloc]init];
    } else if ([self.arr[indexPath.row] isEqualToString:@"Button"]) {
        vc = [[UIButtonViewController alloc]init];
    } else if ([self.arr[indexPath.row] isEqualToString:@"UIView"]) {
        vc = [[UIViewViewController alloc]init];
    } else if ([self.arr[indexPath.row] isEqualToString:@"ViewController"]) {
        vc = [[VCViewController alloc]init];
    } else if ([self.arr[indexPath.row] isEqualToString:@"NSTimer"]) {
        vc = [[NSTimerViewController alloc]init];
    } else if ([self.arr[indexPath.row] isEqualToString:@"UISwitch"]) {
        vc = [[UISwitchViewController alloc]init];
    } else if ([self.arr[indexPath.row] isEqualToString:@"UISlider和 UIProgressView"]) {
        vc = [[UISliderAndProgressViewController alloc]init];
    } else if ([self.arr[indexPath.row] isEqualToString:@"UIStepper和 UISegmentControl"]) {
        vc = [[UIStepperAndSegmentControlViewController alloc]init];
    } else if ([self.arr[indexPath.row] isEqualToString:@"UIAlertController和 UIActivity"]) {
        vc = [[UIAlertAndActivityViewController alloc]initWithNibName:@"UIAlertAndActivityViewController" bundle:nil];
    } else if ([self.arr[indexPath.row] isEqualToString:@"TextField"]) {
        vc = [[UITextFieldViewController alloc]init];
    } else if ([self.arr[indexPath.row] isEqualToString:@"ScrollView"]) {
        vc = [[UIScrollViewController alloc]init];
    } else if ([self.arr[indexPath.row] isEqualToString:@"ScrollView代理"]) {
        vc = [[UIScrollDelegateViewController alloc]init];
    } else if ([self.arr[indexPath.row] isEqualToString:@"ScrollView缩放"]) {
        vc = [[UIScrollScaleViewController alloc]initWithNibName:@"UIScrollScaleViewController" bundle:nil];
    } else if ([self.arr[indexPath.row] isEqualToString:@"UICollectionView"]) {
        vc = [[UICollectionViewViewController alloc]init];
    } else if ([self.arr[indexPath.row] isEqualToString:@"UITouch"]) {
        vc = [[UITouchViewController alloc]init];
    } else if ([self.arr[indexPath.row] isEqualToString:@"UIGesture基础"]) {
        vc = [[UIGestureViewController alloc]init];
    } else if ([self.arr[indexPath.row] isEqualToString:@"UIGesture高级"]) {
        vc = [[UIGesture2ViewController alloc]init];
    } else if ([self.arr[indexPath.row] isEqualToString:@"UIGesture扩展"]) {
        vc = [[UIGesture3ViewController alloc]init];
    } else if ([self.arr[indexPath.row] isEqualToString:@"UINavigationController"]) {
        vc = [[NavigationViewController alloc]init];
    } else if ([self.arr[indexPath.row] isEqualToString:@"UITabBarController"]) {
        vc = [[UITabBarControllerViewController alloc]init];
        [vc setHidesBottomBarWhenPushed:YES]; //隐藏底部的tabbar
    } else if ([self.arr[indexPath.row] isEqualToString:@"UIPickerView"]) {
        vc = [[UIPickerViewController alloc]init];
    } else if ([self.arr[indexPath.row] isEqualToString:@"UITableView"]) {
        vc = [[TableViewController alloc]init];
    } else if ([self.arr[indexPath.row] isEqualToString:@"UITextView"]) {
        vc = [[UITextViewViewController alloc]init];
    } else if ([self.arr[indexPath.row] isEqualToString:@"UIWebView"]) {
        vc = [[UIWebViewViewController alloc]initWithNibName:@"UIWebViewViewController" bundle:nil];
    } else if ([self.arr[indexPath.row] isEqualToString:@"UISearchController"]) {
        vc = [[SearchViewController alloc]init];
    } else if ([self.arr[indexPath.row] isEqualToString:@"AVAudioPlayer"]) {
        vc = [[AVAudioPlayerViewController alloc]init];
    } else if ([self.arr[indexPath.row] isEqualToString:@"AVPlayerViewController"]) {
        vc = [[AVPlayerViewViewController alloc]init];
    } 
    [self.navigationController pushViewController:vc animated:YES];
}


@end
