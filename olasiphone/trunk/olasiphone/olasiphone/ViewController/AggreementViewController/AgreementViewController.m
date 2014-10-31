//
//  AgreementViewController.m
//  SOSolidier
//
//  Created by xiaoguizi on 14-9-10.
//  Copyright (c) 2014年 xiaoguizi. All rights reserved.
//

#import "AgreementViewController.h"
#import "InstallDocViewController.h"
@interface AgreementViewController ()
{
    UILabel *titleLabel;
    UILabel *versionLabel;
    UILabel *contentLabel;
    UILabel *readLabel;
    UIButton *aggreeBtn;
}

@end

@implementation AgreementViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.view.backgroundColor = Colour(242, 243, 245, 1);
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
//    NSLog(@"%f",[UIScreen mainScreen].bounds.size.width);
    titleLabel  = [[UILabel alloc] initWithFrame:CGRectMake(ScreenWidth/2-75,150, 150, 20)];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = [UIFont boldSystemFontOfSize:20.0];
    [titleLabel setBackgroundColor:Colour(242, 243, 245, 1)];
    titleLabel.text = @"寻找抗战老兵";
    
    versionLabel = [[UILabel alloc] initWithFrame:CGRectMake(ScreenWidth/2-75,180, 150, 20)];
    versionLabel.font = [UIFont systemFontOfSize:11.0];
    versionLabel.textColor  = Colour(31, 31, 31, 1);
    [versionLabel setBackgroundColor:Colour(242, 243, 245, 1)];
    versionLabel.textAlignment = NSTextAlignmentCenter;
    NSDictionary *info = [[NSBundle mainBundle] infoDictionary];
    versionLabel.text = [info objectForKey:@"CFBundleVersion"];
    
    contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(ScreenWidth/2-75, 270, 150, 20)];
    contentLabel.textColor = Colour(31, 31, 31, 1);
     contentLabel.font = [UIFont systemFontOfSize:12.0];
    [contentLabel setBackgroundColor:Colour(242, 243, 245, 1)];
    contentLabel.textAlignment = NSTextAlignmentCenter;
    contentLabel.text = @"继续即将代表您：";
    
    readLabel = [[UILabel alloc] initWithFrame:CGRectMake(ScreenWidth/2-90, 290,80, 20)];
    readLabel.textColor = Colour(31, 31, 31, 1);
//    readLabel.backgroundColor = [UIColor redColor];
    readLabel.font = [UIFont systemFontOfSize:12.0];
    [readLabel setBackgroundColor:Colour(242, 243, 245, 1)];
    readLabel.textAlignment = NSTextAlignmentRight;
    readLabel.text = @"已阅读并同意";
    
    _aggreeLabel = [[MyLabel alloc] initWithFrame:CGRectMake(ScreenWidth/2-10,290, 100, 20)];
    _aggreeLabel.textColor = Colour(31, 31, 31, 1);
    _aggreeLabel.delegate = self;
//    _aggreeLabel.backgroundColor = [UIColor redColor];
    _aggreeLabel.font = [UIFont systemFontOfSize:12.0];
    _aggreeLabel.textAlignment = NSTextAlignmentLeft;
    NSMutableAttributedString *content = [[NSMutableAttributedString alloc] initWithString:@"《安装许可协议》"];
    NSRange contenRange = {0,[content length]};
    [_aggreeLabel setBackgroundColor:Colour(242, 243, 245, 1)];
    [content addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:contenRange];
    _aggreeLabel.attributedText = content;

    aggreeBtn = [[UIButton alloc] initWithFrame:CGRectMake(ScreenWidth/2-110, 410, 220, 36)];
    [aggreeBtn setImage:[UIImage imageNamed:@"agree"] forState:UIControlStateNormal];
    [aggreeBtn addTarget:self action:@selector(getIn) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:titleLabel];
    [self.view addSubview: versionLabel];
    [self.view addSubview:contentLabel];
    [self.view addSubview:readLabel];
    [self.view addSubview:_aggreeLabel];
    [self.view addSubview:aggreeBtn];
    
}
-(void)getIn
{
    WebViewController *webView = [[WebViewController alloc] init];
    [[UIApplication sharedApplication] keyWindow].rootViewController = webView;
    //写入数据
}
#pragma mark - MyLabelDelegate
-(void)myLabel:(MyLabel *)myLabel touchesWithTag:(NSInteger)tag
{
        InstallDocViewController *install = [[InstallDocViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:install];
    [self presentViewController:nav animated:YES completion:nil];
}
@end
