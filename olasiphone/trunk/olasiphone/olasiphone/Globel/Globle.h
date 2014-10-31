//
//  Globle.h
//  SOSolidier
//
//  Created by xiaoguizi on 14-8-25.
//  Copyright (c) 2014年 xiaoguizi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Globle : NSObject

+(id)shared;


+(void)setConfig:(id)value forKey:(NSString*)key;
+(NSString *)getConfig:(NSString *)key;
+(id)configForKey:(NSString *)key;
//
@end



static NSString *const IfFirstIn = @"is_first";  //是否首次登陆
static NSString *const IfNeedRefresh = @"is_refrest";   //从后台进入是否刷新网络