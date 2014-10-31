//
//  GlobleConst.h
//  SOSolidier
//
//  Created by sanyue on 14-8-15.
//  Copyright (c) 2014年 xiaoguizi. All rights reserved.
//

#ifndef SOSolidier_GlobleConst_h
#define SOSolidier_GlobleConst_h

#define ViewController(a) [[NSClassFromString(a) alloc] init]   //定义ViewController
#define IOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]   //定义ios版本
#define Colour(R,G,B,A) [UIColor colorWithRed:(R/255.0) green:(G/255.0) blue:(B/255.0) alpha:A]  //定义颜色
#define ScreenWidth [UIScreen mainScreen].bounds.size.width    //用于判断iphone5,6
#endif
