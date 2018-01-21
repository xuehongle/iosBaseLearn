//
//  Block2ViewController.m
//  IOSBaseLearn
//
//  Created by xue on 2017/8/9.
//  Copyright © 2017年 xue. All rights reserved.
//

#import "Block2ViewController.h"

@interface Block2ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;

- (IBAction)save:(id)sender;
@end

@implementation Block2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (IBAction)save:(id)sender {
    if (self.complete) {
        self.complete(self.textField.text);
    }
    [self.navigationController popViewControllerAnimated:YES];
}
@end
