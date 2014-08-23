//
//  DatabaseManager.m
//  iBiking
//
//  Created by shangze_mac_20131209 on 14-8-5.
//  Copyright (c) 2014年 Geeko. All rights reserved.
//

#import "DatabaseManager.h"
#import "SysInfo.h"
#import "AppDelegate.h"
#import "MobClick.h"

@implementation DatabaseManager
{
    
}

-(BOOL)CheckDbSystem;
{
    AppDelegate *delegate = APP;
	if(![[NSFileManager defaultManager] fileExistsAtPath:delegate.sysConfig.DBFullPath])
	{
		NSString *backupDbPath = [[NSBundle mainBundle] pathForResource:DATABASE_RESOURCE_NAME ofType:DATABASE_RESOURCE_TYPE];
        
        BOOL copiedBackupDb = [[NSFileManager defaultManager] copyItemAtPath:backupDbPath toPath:delegate.sysConfig.DBFullPath error:nil];
        if(!copiedBackupDb)
        {
            return NO;
        }
        
        [SysInfo SetDbCopyed:1];
        [SysInfo SetDbVersionId:CurrentDbVersion];
        
	}
    
    //可能是升级用户
    
    int oldDbVersion = [SysInfo GetDbVersionId];
    if(oldDbVersion<CurrentDbVersion)
    {
        SLOG(@"需要更新数据库");
        if(DB_UPDATE_MODE==DB_UPDATE_MODE_REWRITE_ALL_TABLE)
        {
            //数据库发生了更新
            NSString *backupDbPath = [[NSBundle mainBundle] pathForResource:DATABASE_RESOURCE_NAME ofType:DATABASE_RESOURCE_TYPE];
            if(backupDbPath==nil){
                [MobClick event:@"严重错误！基础数据库不存在！"];
                return NO;
            }else {
                [[NSFileManager defaultManager] removeItemAtPath:delegate.sysConfig.DBFullPath error:nil];
                BOOL copiedBackupDb = [[NSFileManager defaultManager] copyItemAtPath:backupDbPath toPath:delegate.sysConfig.DBFullPath error:nil];
                if(!copiedBackupDb)
                {
                    [MobClick event:@"严重错误！基础数据库无法拷贝到文件系统中！"];
                    return NO;
                }
                [SysInfo SetDbCopyed:1];
                [SysInfo SetDbVersionId:CurrentDbVersion];
            }
        }else if(DB_UPDATE_MODE==DB_UPDATE_MODE_INSERT_NEW_TABLE)
        {
            SLOG(@"DB_UPDATE_MODE_INSERT_NEW_TABLE");
            
//            [DbUpdate StartDbaseUpdateWork];
            [SysInfo SetDbVersionId:CurrentDbVersion];
        }
    }
    
	return YES;
}



@end
