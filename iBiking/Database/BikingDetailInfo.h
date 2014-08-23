//
//  BikingDetailInfo.h
//  iBiking
//
//  Created by shangze_mac_20131209 on 14-8-5.
//  Copyright (c) 2014年 Geeko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"
#import "FMResultSet.h"
#import "FMDatabaseQueue.h"

@interface BikingDetailInfo : NSObject
{
    
}

@property(nonatomic,assign) float ID;
@property(nonatomic,assign) int BikingHistoryId;
@property(nonatomic,retain) NSString *DateTime;
@property(nonatomic,assign) float Longitude;
@property(nonatomic,assign) float Latitude;
@property(nonatomic,assign) BOOL IsEnable;
@property(nonatomic,retain) NSString *Remark;


+(NSMutableArray*)GetListByHistoryId:(int) historyId;
+(NSMutableArray*)GetBriefListByHistoryId:(int) historyId;
+(BOOL)Add:(BikingDetailInfo *)detail;
+(BOOL)AddArray:(NSMutableArray *)array;
+(BOOL)Del:(BikingDetailInfo *)detail;
+(BOOL)DelWithId:(int )detail;
+(BOOL)DelWithHistoryId:(int )keyId;
+(BOOL)DelAll;
@end
