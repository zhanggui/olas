//
//  MyLabel.h
//  SOSolidier
//
//  Created by xiaoguizi on 14-9-10.
//  Copyright (c) 2014年 xiaoguizi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MyLabel;
@protocol MyLabelDelegate <NSObject>

-(void)myLabel:(MyLabel *)myLabel touchesWithTag:(NSInteger)tag;

@end
@interface MyLabel : UILabel
{
    id <MyLabelDelegate> delegate;
}

@property(nonatomic,retain)id <MyLabelDelegate>delegate;
@end
