//
//  BikingHistory.h
//  iBiking
//
//  Created by shangze_mac_20131209 on 14-8-5.
//  Copyright (c) 2014年 Geeko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"
#import "FMResultSet.h"
#import "FMDatabaseQueue.h"

@interface BikingHistory : NSObject
{
    
}

@property(nonatomic,assign) float ID;
@property(nonatomic,retain) NSString *Date;
@property(nonatomic,retain) NSString *StartDateTime;
@property(nonatomic,retain) NSString *EndDateTime;
@property(nonatomic,retain) NSString *WeekName;
@property(nonatomic,assign) float BikingTotal;
@property(nonatomic,assign) float BikingTime;
@property(nonatomic,assign) float IsSynced;
@property(nonatomic,assign) BOOL IsEnable;
@property(nonatomic,retain) NSString *Remark;
@property(nonatomic,retain) NSString *SyncedDateTime;

@property(nonatomic,retain) NSMutableArray *KeyBikingLocations;


+(BikingHistory *)GetHistoryDataByHistoryId:(int) historyId;
+(BikingHistory *)GetHistoryInstanceByDate:(NSString *) sDate;
+(int)GetMaxHistoryId;
+(BOOL)Add:(BikingHistory *) bikingHistory;
+(BOOL)Update:(BikingHistory *) bikingHistory;
//+(BOOL)AddArray:(NSMutableArray *)array;
+(BOOL)Del:(BikingHistory *)detail;
+(BOOL)DelWithHistoryId:(int )historyId;
+(BOOL)DelAllWithHistoryId:(int )historyId;
+(BOOL)DelAll;

-(float)GetAllBikingDistance;
@end
