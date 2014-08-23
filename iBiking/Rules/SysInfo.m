//
//  SysInfo.m
//  iHome
//
//  Created by Chen Shengzhi on 13-10-14.
//  Copyright (c) 2013年 com.9tong. All rights reserved.
//





#define UD_If_Db_Copyed        @"If_Db_Copyed"
#define UD_CURRENT_DB_VERSION  @"CurrentDbVersion"


#import "SysInfo.h"

@implementation SysInfo



+(BOOL)IfDbCopyed;
{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults] ;
	NSInteger r = [userDefault integerForKey:UD_If_Db_Copyed];
	if(r==0)
		return NO;
	else
		return YES;
}



+(void)SetDbCopyed:(NSInteger)_value;
{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults] ;
	[userDefault setInteger:_value forKey:UD_If_Db_Copyed];
    [userDefault synchronize];
}



+(NSInteger)GetDbVersionId;
{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults] ;
	NSInteger r = [userDefault integerForKey:UD_CURRENT_DB_VERSION];
    return r;
}

+(void)SetDbVersionId:(NSInteger)_versionId;
{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults] ;
	[userDefault setInteger:_versionId forKey:UD_CURRENT_DB_VERSION];
    [userDefault synchronize];
}
@end
