//
//  BikingDetailInfo.m
//  iBiking
//
//  Created by shangze_mac_20131209 on 14-8-5.
//  Copyright (c) 2014年 Geeko. All rights reserved.
//

#import "BikingDetailInfo.h"
#import "AppDelegate.h"

@implementation BikingDetailInfo
{
    
}

@synthesize ID;
@synthesize BikingHistoryId;
@synthesize DateTime;
@synthesize Longitude;
@synthesize Latitude;
@synthesize IsEnable;
@synthesize Remark;



+(NSMutableArray*)GetListByHistoryId:(int) historyId
{
    AppDelegate *app = APP;
    NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:50] ;
    FMDatabase *db = [FMDatabase databaseWithPath:app.sysConfig.DBFullPath];
    if([db open])
    {
        NSString *sqlstr = [NSString stringWithFormat:@"select * from BikingDetailInfo where IsEnable = 1 and BikingHistoryId = %d",historyId];
        FMResultSet *rs = [db executeQuery:sqlstr];
        while ([rs next])
        {
            BikingDetailInfo *unit = [[BikingDetailInfo alloc] init] ;
            [BikingDetailInfo ReadFromFMResultSet:rs unit:unit];
            [array addObject:unit];
        }
        [rs close];
        [db close];
    }
    
    return array;
}

+(NSMutableArray*)GetBriefListByHistoryId:(int) historyId
{
    return [self GetListByHistoryId:historyId];
}

+(void)ReadFromFMResultSet:(FMResultSet*)rs unit:(BikingDetailInfo *)unit;
{
    unit.ID = [rs doubleForColumn:@"ID"];
    unit.BikingHistoryId = [rs intForColumn:@"BikingHistoryId"];
    unit.DateTime = [rs stringForColumn:@"DateTime"];
    unit.Longitude = [rs doubleForColumn:@"Longitude"];
    unit.Latitude = [rs doubleForColumn:@"Latitude"];
    unit.Remark = [rs stringForColumn:@"Remark"];
}

+(BOOL)Add:(BikingDetailInfo *)detail
{
    AppDelegate *sdsk = (AppDelegate*)[UIApplication sharedApplication].delegate;
    FMDatabaseQueue *queue = [FMDatabaseQueue databaseQueueWithPath:sdsk.sysConfig.DBFullPath];
    [queue inTransaction:^(FMDatabase *db, BOOL *rollback) {
        NSDictionary *argsDict = [NSDictionary dictionaryWithObjectsAndKeys:
                                  [NSNumber numberWithLong:detail.BikingHistoryId ],@"BikingHistoryId",
                                  detail.DateTime,@"DateTime",
                                  [NSNumber numberWithFloat:detail.Longitude ],@"Longitude",
                                  [NSNumber numberWithFloat:detail.Latitude ],@"Latitude",
                                  detail.Remark,@"Remark",
                                  nil];
        BOOL r = [db executeUpdate:@"insert into BikingDetailInfo(BikingHistoryId,DateTime,Longitude,Latitude,Remark) values(:BikingHistoryId,:DateTime,:Longitude,:Latitude,:Remark);"
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

+(BOOL)AddArray:(NSMutableArray *)array;
{
    return TRUE;
}

+(BOOL)Del:(BikingDetailInfo *)detail
{
    return TRUE;
}

+(BOOL)DelWithId:(int )detail
{
    return TRUE;
}

+(BOOL)DelWithHistoryId:(int )keyId;
{
    return TRUE;
}

+(BOOL)DelAll;
{
    return TRUE;
}
@end
