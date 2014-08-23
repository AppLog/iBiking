//
//  BikingHistory.m
//  iBiking
//
//  Created by shangze_mac_20131209 on 14-8-5.
//  Copyright (c) 2014年 Geeko. All rights reserved.
//

#import "BikingHistory.h"
#import "AppDelegate.h"

@implementation BikingHistory
{
    
}


@synthesize ID;
@synthesize Date;
@synthesize StartDateTime;
@synthesize EndDateTime;
@synthesize WeekName;
@synthesize BikingTotal;
@synthesize BikingTime;
@synthesize IsSynced;
@synthesize IsEnable;
@synthesize Remark;
@synthesize SyncedDateTime;

-(id)init
{
    self = [super init];
    if (self) {
        Date = @"";
        StartDateTime = @"";
        EndDateTime = @"";
        WeekName = @"";
        Remark = @"";
    }
    return self;
}



+(BikingHistory *)GetHistoryDataByHistoryId:(int) historyId;
{
    AppDelegate *app = APP;
    BikingHistory *unit = nil;
    FMDatabase *db = [FMDatabase databaseWithPath:app.sysConfig.DBFullPath];
    if([db open])
    {
        NSString *sqlstr = [NSString stringWithFormat:@"select * from BikingHistory where IsEnable = 1 and BikingHistoryId = %d",historyId];
        FMResultSet *rs = [db executeQuery:sqlstr];
        while ([rs next])
        {
            unit = [[BikingHistory alloc] init] ;
            [BikingHistory ReadFromFMResultSet:rs unit:unit];
        }
        [rs close];
        [db close];
    }
    
    return unit;
}


+(BikingHistory *)GetHistoryInstanceByDate:(NSString *) sDate;
{
    AppDelegate *app = APP;
    BikingHistory *unit = nil;
    FMDatabase *db = [FMDatabase databaseWithPath:app.sysConfig.DBFullPath];
    if([db open])
    {
        NSString *sqlstr = [NSString stringWithFormat:@"select * from BikingHistory where IsEnable = 1 and Date = '%@'",sDate];
        FMResultSet *rs = [db executeQuery:sqlstr];
        while ([rs next])
        {
            unit = [[BikingHistory alloc] init] ;
            [BikingHistory ReadFromFMResultSet:rs unit:unit];
        }
        [rs close];
        [db close];
    }
    
    return unit;
}

+(int)GetMaxHistoryId
{
    AppDelegate *app = APP;
    int maxId = 0;
    FMDatabase *db = [FMDatabase databaseWithPath:app.sysConfig.DBFullPath];
    if([db open])
    {
        NSString *sqlstr = [NSString stringWithFormat:@"select max(ID) as ID from BikingHistory where IsEnable = 1"];
        FMResultSet *rs = [db executeQuery:sqlstr];
        while ([rs next])
        {
            maxId = [rs intForColumn:@"ID"];
        }
        [rs close];
        [db close];
    }
    
    return maxId;
}

+(void)ReadFromFMResultSet:(FMResultSet*)rs unit:(BikingHistory *)unit;
{
    unit.ID = [rs intForColumn:@"ID"];
    unit.Date = [rs stringForColumn:@"Date"];
    unit.StartDateTime = [rs stringForColumn:@"StartDateTime"];
    unit.EndDateTime = [rs stringForColumn:@"EndDateTime"];
    unit.WeekName = [rs stringForColumn:@"WeekName"];
    unit.BikingTotal = [rs doubleForColumn:@"BikingTotal"];
    unit.BikingTime = [rs intForColumn:@"BikingTime"];
    unit.IsSynced = [rs boolForColumn:@"IsSynced"];
    unit.IsEnable = [rs boolForColumn:@"IsEnable"];
    unit.Remark = [rs stringForColumn:@"Remark"];
    unit.SyncedDateTime = [rs stringForColumn:@"SyncedDateTime"];
}

+(BOOL)Add:(BikingHistory *) bikingHistory
{
    AppDelegate *sdsk = (AppDelegate*)[UIApplication sharedApplication].delegate;
    FMDatabaseQueue *queue = [FMDatabaseQueue databaseQueueWithPath:sdsk.sysConfig.DBFullPath];
    [queue inTransaction:^(FMDatabase *db, BOOL *rollback) {
        NSDictionary *argsDict = [NSDictionary dictionaryWithObjectsAndKeys:
                                  bikingHistory.Date,@"Date",
                                  bikingHistory.StartDateTime,@"StartDateTime",
                                  bikingHistory.EndDateTime,@"EndDateTime",
                                  bikingHistory.WeekName,@"WeekName",
                                  [NSNumber numberWithFloat:bikingHistory.BikingTotal ],@"BikingTotal",
                                  [NSNumber numberWithInteger:bikingHistory.BikingTime ],@"BikingTime",
                                  bikingHistory.Remark,@"Remark",
                                  nil];
        
        
        BOOL r = [db executeUpdate:@"insert into BikingHistory(Date,StartDateTime,EndDateTime,WeekName,BikingTotal,BikingTime,Remark) values(:Date,:StartDateTime,:EndDateTime,:WeekName,:BikingTotal,:BikingTime,:Remark);"
           withParameterDictionary:argsDict];
        if(r)
        {
            //获取自动编号
            FMResultSet *rs = [db executeQuery:@"select last_insert_rowid()"];
            while ([rs next]) {
                
            }
            [rs close];
        }
    }];
    [queue close];
    return YES;
}

+(BOOL)Update:(BikingHistory *) bikingHistory
{
    AppDelegate *sdsk = (AppDelegate*)[UIApplication sharedApplication].delegate;
    FMDatabaseQueue *queue = [FMDatabaseQueue databaseQueueWithPath:sdsk.sysConfig.DBFullPath];
    [queue inTransaction:^(FMDatabase *db, BOOL *rollback) {
        
        NSString *sqlstr = [NSString stringWithFormat:@"select * from BikingHistory where IsEnable = 1 and ID = '%d'",(int)bikingHistory.ID];
        FMResultSet *rs = [db executeQuery:sqlstr];
        BOOL bExist = false;
        while ([rs next])
        {
            //有数据，则更新
            bExist = TRUE;
            break;
        }
        
        if (bExist) {
            NSDictionary *argsDict = [NSDictionary dictionaryWithObjectsAndKeys:
                                      [NSNumber numberWithInt:bikingHistory.ID ],@"ID",
                                      bikingHistory.EndDateTime,@"EndDateTime",
                                      [NSNumber numberWithFloat:bikingHistory.BikingTotal ],@"BikingTotal",
                                      [NSNumber numberWithFloat:bikingHistory.BikingTime ],@"BikingTime",
                                      nil];
            
            
            BOOL r = [db executeUpdate:@"update BikingHistory set EndDateTime =:EndDateTime,BikingTotal = :BikingTotal,BikingTime = :BikingTime where ID = :ID"
               withParameterDictionary:argsDict];
            if(r)
            {
                //获取自动编号
                FMResultSet *rs = [db executeQuery:@"select last_insert_rowid()"];
                while ([rs next]) {
                    
                }
                [rs close];
            }
        }
        else
        {
            
        }
        
        
    }];
    [queue close];
    return YES;
}

+(BOOL)Del:(BikingHistory *)detail
{
    return TRUE;
}

+(BOOL)DelWithHistoryId:(int )historyId
{
    return TRUE;
}

+(BOOL)DelAllWithHistoryId:(int )historyId
{
    return TRUE;
}

+(BOOL)DelAll
{
    return TRUE;
}

//获取数据库中的骑行总里程
-(float)GetAllBikingDistance
{
    AppDelegate *app = APP;
    int maxId = 0;
    FMDatabase *db = [FMDatabase databaseWithPath:app.sysConfig.DBFullPath];
    if([db open])
    {
        NSString *sqlstr = [NSString stringWithFormat:@"select sum(BikingTotal) as Distance from BikingHistory where IsEnable = 1"];
        FMResultSet *rs = [db executeQuery:sqlstr];
        while ([rs next])
        {
            maxId = [rs doubleForColumn:@"BikingTotal"];
        }
        [rs close];
        [db close];
    }
    
    return maxId;
}
@end
