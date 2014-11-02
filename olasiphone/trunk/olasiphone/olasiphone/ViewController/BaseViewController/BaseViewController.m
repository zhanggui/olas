//
//  BaseViewController.m
//  olasiphone
//
//  Created by xiaoguizi on 14/11/2.
//  Copyright (c) 2014年 xiaoguizi. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)alert:(NSString *)text
{
    _hud = [[MBProgressHUD alloc] initWithView:self.view];
    [[UIApplication sharedApplication].keyWindow addSubview:_hud];
    _hud.mode = MBProgressHUDModeCustomView;
    _hud.labelText = text;
    [_hud show:YES];
    [_hud hide:YES afterDelay:1];
}
@end
