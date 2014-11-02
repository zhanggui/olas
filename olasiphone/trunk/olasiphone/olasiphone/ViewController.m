//
//  ViewController.m
//  olasiphone
//
//  Created by xiaoguizi on 14/11/1.
//  Copyright (c) 2014年 xiaoguizi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =Colour(1, 1, 1, 1);
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(20, 20, 30, 40)];
    btn.backgroundColor = [UIColor redColor];
    [btn addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}
-(void)btnAction
{
    [self alert:@"sdfsadfds"];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
