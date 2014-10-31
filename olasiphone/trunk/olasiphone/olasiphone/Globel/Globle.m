//
//  Globle.m
//  SOSolidier
//
//  Created by xiaoguizi on 14-8-25.
//  Copyright (c) 2014年 xiaoguizi. All rights reserved.
//

#import "Globle.h"

static Globle *globle = nil;   //静态实例，并初始化
@implementation Globle



+(id)shared
{
    if(globle==nil)
    {
        globle = [[Globle alloc] init];
    }
    return globle;
}

+(id)configForKey:(NSString *)key
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults objectForKey:key];
}
+(void)setConfig:(id)value forKey:(NSString *)key
{
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    [user setObject:value forKey:key];
    [user synchronize];
}
+(NSString *)getConfig:(NSString *)key
{
    NSString *s = [Globle  configForKey:key];
    if(s==nil)
    {
        return @"";
    }
    return s;
}
@end
