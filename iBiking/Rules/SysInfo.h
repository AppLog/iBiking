//
//  SysInfo.h
//  iHome
//
//  Created by Chen Shengzhi on 13-10-14.
//  Copyright (c) 2013年 com.9tong. All rights reserved.
//

#import <Foundation/Foundation.h>


#define DB_UPDATE_MODE 2
/**
 数据库升级方式:更新整个数据库；
 
 整库更新时，用户需要重新登录，但用户的帐号和密码会保留，以便用户快速重新登录；
 */
#define DB_UPDATE_MODE_REWRITE_ALL_TABLE      1
/**
 数据库升级方式:仅插入新的数据库；
 */
#define DB_UPDATE_MODE_INSERT_NEW_TABLE       2

//如果数据库发生变更，则需要增加CurrenetDbVersion的值；
#define CurrentDbVersion 4


@interface SysInfo : NSObject
+(BOOL)IfDbCopyed;
+(void)SetDbCopyed:(NSInteger)_value;
+(NSInteger)GetDbVersionId;
+(void)SetDbVersionId:(NSInteger)_versionId;
@end
