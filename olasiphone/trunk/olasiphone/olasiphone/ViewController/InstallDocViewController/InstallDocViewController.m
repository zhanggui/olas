//
//  WebViewController.m
//  SOSolidier
//
//  Created by xiaoguizi on 14-8-25.
//  Copyright (c) 2014年 xiaoguizi. All rights reserved.
//

#import "InstallDocViewController.h"

@interface InstallDocViewController ()
{
    UIButton *reRequestBtn;
    UIButton *settingRequestBtn;
    UIView *netContainer;
    NSTimer *timer;
    int webTimoutInter;
}
@end

@implementation InstallDocViewController
static NSString *isfresh;
static UIWebView * webView;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    webTimoutInter = 5;
     self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    webView = [[UIWebView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    webView.scrollView.bounces = NO;
    webView.delegate = self;
    webView.opaque = NO;   //设置是否透明
    webView.backgroundColor = [UIColor clearColor];
    
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://laobing.360.cn/protocol.html"]]];
    [self.view addSubview:webView];
    [self addNetErrorView];
}
-(void)back
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)addNetErrorView
{
    netContainer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height)];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(ScreenWidth/2-100,150,200,30)];
    label.textAlignment = NSTextAlignmentLeft;
    label.font = [UIFont systemFontOfSize:15];
    label.text = @"网络无法访问！";
    label.textColor = [UIColor grayColor];
    [netContainer addSubview:label];
    NSArray *strArr = [[NSArray alloc] initWithObjects:@"可能原因",@"网络不稳定",@"尚未接入互联网",@"安全软件禁止访问互联网",@"您禁止了该软件对网络的使用", nil];
    for(int i=0;i<5;i++)
    {
        UILabel *st = [[UILabel alloc] initWithFrame:CGRectMake(ScreenWidth/2-80, label.bottom+i*20, 200, 20)];
        st.textAlignment = NSTextAlignmentLeft;
        st.text = strArr[i];
        st.font = [UIFont systemFontOfSize:13];
        st.textColor = [UIColor lightGrayColor];
        [netContainer addSubview:st];
    }
    
    reRequestBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    reRequestBtn.frame = CGRectMake(ScreenWidth/2-65, 350, 130, 43);
    [reRequestBtn setBackgroundImage:[UIImage imageNamed:@"reconnect.png"] forState:UIControlStateNormal];
    [reRequestBtn addTarget:self action:@selector(reConnect) forControlEvents:UIControlEventTouchUpInside];
    [netContainer addSubview:reRequestBtn];
    netContainer.hidden=YES;
    [self.view addSubview:netContainer];
}

#pragma mark - UIWebViewDelegate

-(void)webViewDidStartLoad:(UIWebView *)webView
{
    [self HUDShowTest:@"加载中..."];
    netContainer.hidden=YES;
    timer = [NSTimer scheduledTimerWithTimeInterval:webTimoutInter target:self selector:@selector(cancelWeb) userInfo:nil repeats:NO];
    
}
-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self HUDHide];
    //禁止长按复制和弹出东西
    [webView stringByEvaluatingJavaScriptFromString:@"document.documentElement.style.webkitUserSelect='none';"];
    [webView stringByEvaluatingJavaScriptFromString:@"document.documentElement.style.webkitTouchCallout='none';"];
    [Globle setConfig:@"false" forKey:IfFirstIn];
    [timer invalidate];
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    
    if([request.mainDocumentURL.relativePath isEqualToString:@"/index.php/Home/User/ios"]) {
        
        return NO;
    }
    
    return YES;
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    if(error)
    {
        [self didWebFail];
    }
}
+(NSString *)getIFRefreash    //在后台进入时判断是否需要刷新
{
    return isfresh;
}
+(UIWebView *)getWebView
{
    return webView;
}
-(void)reConnect
{
    //show and reload
    isfresh = @"";
    netContainer.hidden=YES;
    webView.hidden = NO;
    
    if([[webView.request.URL absoluteString] isEqualToString:@""])
    {
        [self viewDidLoad];
    }else{
        [webView reload];
    }
}

-(void)didWebFail
{
    [self HUDHide];
    [self alert:@"网络有点问题，请稍后再试"];
    //隐藏webview
    webView.hidden=YES;
    netContainer.hidden=NO;
    [webView stopLoading];
    isfresh = @"need";
}

-(void)cancelWeb
{
    //超时取消
    [self didWebFail];
}

@end
