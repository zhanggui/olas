//
//  LoginViewController.m
//  olasiphone
//
//  Created by xiaoguizi on 14/11/2.
//  Copyright (c) 2014年 xiaoguizi. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addGesTapGesture];
    _contentView.frame = CGRectMake(42, 540, 236, 258);
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0];
    CGAffineTransform moveTransform = CGAffineTransformMakeTranslation(0, -435);
    [_contentView.layer setAffineTransform:moveTransform];
    [UIView commitAnimations];
   
}


- (IBAction)LoginAction:(id)sender {
    [self.view endEditing:YES];
    [self HUDShowText:@"登录中..."];
}
@end
