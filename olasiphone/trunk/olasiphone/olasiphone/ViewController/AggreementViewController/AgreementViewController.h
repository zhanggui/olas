//
//  AgreementViewController.h
//  SOSolidier
//
//  Created by xiaoguizi on 14-9-10.
//  Copyright (c) 2014年 xiaoguizi. All rights reserved.
//

#import "BaseViewController.h"
#import "MyLabel.h"
@interface AgreementViewController : BaseViewController<MyLabelDelegate>


@property(nonatomic,strong)MyLabel *aggreeLabel;
@end
