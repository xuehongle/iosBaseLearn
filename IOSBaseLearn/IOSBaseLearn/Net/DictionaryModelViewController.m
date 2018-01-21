//
//  DictionaryModelViewController.m
//  IOSBaseLearn
//
//  Created by 薛乐 on 2017/9/4.
//  Copyright © 2017年 xue. All rights reserved.
//

#import "DictionaryModelViewController.h"
#import "News.h"

@interface DictionaryModelViewController ()
- (IBAction)btnClick:(id)sender;

@end

@implementation DictionaryModelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)btnClick:(id)sender {
    NSURL *url = [NSURL URLWithString:@"http://c.m.163.com/nc/article/headline/T1348647853363/0-20.html"];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        // 反序列化
        NSDictionary *result = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
        // 数组
        //        NSLog(@"%@", result[@"T1348647853363"]);
        
        NSArray *array = result[@"T1348647853363"];
        // 遍历数组，字典转模型
        for (NSDictionary *dict in array) {
            NSLog(@"%@", dict);
            News *n = [[News alloc] init];
            
            // setValuesForKeysWithDictionary
            // 字典中有的模型中一定要有
            // 模型中有的属性，字典中可以没有！
            // 目标：就需要模型中那几个属性就够了！
            [n setValuesForKeysWithDictionary:dict];
        }
    }];
}
@end
