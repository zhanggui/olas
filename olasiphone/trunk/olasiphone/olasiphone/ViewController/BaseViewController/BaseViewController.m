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

static MBProgressHUD *hud;
- (void)viewDidLoad {
    [super viewDidLoad];
    if (!_hud) {
        if (!hud) {
            hud = [[MBProgressHUD alloc] initWithView:self.view];
        }
        _hud = hud;
    }
    
    [[UIApplication sharedApplication].keyWindow addSubview:_hud];
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

-(void)HUDShowText:(NSString *)text
{
    [[[[UIApplication sharedApplication] delegate] window] addSubview:_hud];
    [_hud show:YES];
    _hud.mode = MBProgressHUDModeIndeterminate;
    _hud.dimBackground = YES;
    _hud.labelText = text;
}
-(void)HUDHide
{
    [_hud hide:YES];
}


-(void)addGesTapGesture
{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideTapGesture:)];
    [self.view addGestureRecognizer:tap];
}

-(void)hideTapGesture:(UITapGestureRecognizer *)v
{
    [self.view endEditing:YES];
}
@end
