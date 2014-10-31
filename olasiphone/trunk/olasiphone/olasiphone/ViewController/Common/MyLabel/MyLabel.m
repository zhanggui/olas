//
//  MyLabel.m
//  SOSolidier
//
//  Created by xiaoguizi on 14-9-10.
//  Copyright (c) 2014年 xiaoguizi. All rights reserved.
//

#import "MyLabel.h"

@implementation MyLabel

@synthesize delegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUserInteractionEnabled:YES];
    }
    return self;
}
//点击label高亮显示
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self setTextColor:[UIColor lightGrayColor]];
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self setTextColor:Colour(31, 31, 31, 1)];
//    UITouch *touch = [touches anyObject];
//    CGPoint points = [touch locationInView:self];
//    if (points.x >= self.frame.origin.x && points.y >= self.frame.origin.x && points.x <= self.frame.size.width && points.y <= self.frame.size.height)
//    {
//        [delegate myLabel:self touchesWithTag:self.tag];
        [self show];
//    }
}
-(void)show
{
    [delegate myLabel:self touchesWithTag:self.tag];
}
@end
