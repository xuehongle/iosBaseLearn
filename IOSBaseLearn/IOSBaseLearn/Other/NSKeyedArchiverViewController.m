//
//  NSKeyedArchiverViewController.m
//  IOSBaseLearn
//
//  Created by xue on 2017/7/27.
//  Copyright © 2017年 xue. All rights reserved.
//

#import "NSKeyedArchiverViewController.h"
#import "PersonBean.h"
#import "StudentBean.h"

@interface NSKeyedArchiverViewController ()
- (IBAction)write:(id)sender;
- (IBAction)read:(id)sender;
- (IBAction)subClassWrite:(id)sender;
- (IBAction)subClassRead:(id)sender;

@property (nonatomic, copy) NSString * path;
@end

@implementation NSKeyedArchiverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString * doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    self.path = [doc stringByAppendingPathComponent:@"archiver.txt"];
}


- (IBAction)write:(id)sender {
    //TODO X personbean里有自定义对象怎么办
    PersonBean * person = [[PersonBean alloc]init];
    person.name = @"小明";
    person.age = 28;
    [NSKeyedArchiver archiveRootObject:person toFile:self.path];
}

- (IBAction)read:(id)sender {
    PersonBean * p = [NSKeyedUnarchiver unarchiveObjectWithFile:self.path];
    NSLog(@"p.name = %@, p.age = %d", p.name, p.age);
}

- (IBAction)subClassWrite:(id)sender {
    StudentBean * stu = [[StudentBean alloc]init];
    stu.name = @"小明";
    stu.age = 28;
    stu.height = 180.0f;
    [NSKeyedArchiver archiveRootObject:stu toFile:self.path];
}

- (IBAction)subClassRead:(id)sender {
    StudentBean * stu = [NSKeyedUnarchiver unarchiveObjectWithFile:self.path];
    NSLog(@"stu.name = %@, age = %d, height = %.1f", stu.name, stu.age, stu.height);
}

@end
