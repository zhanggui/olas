//
//  BaseViewController.h
//  olasiphone
//
//  Created by xiaoguizi on 14/11/2.
//  Copyright (c) 2014年 xiaoguizi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"
@interface BaseViewController : UIViewController

@property(nonatomic,strong)MBProgressHUD *hud;
-(void)alert:(NSString *)text;
@end
