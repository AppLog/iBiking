//
//  SysStatus.m
//  iBiking
//
//  Created by shangze_mac_20131209 on 14-8-4.
//  Copyright (c) 2014年 Geeko. All rights reserved.
//

#import "SysStatus.h"
#import "SpeedInfoUnit.h"
#import "SysEnums.h"

static SpeedInfoUnit *_speedInfo;
static BikingHistory *_bikingHistoryInfo;

@implementation SysStatus
{
    
}

+(SpeedInfoUnit *)sharedSpeedInfo
{
    @synchronized(self)
    {
        if (_speedInfo == nil)
        {
            _speedInfo = [[SpeedInfoUnit alloc] init];
        }
        
        return _speedInfo;
    }
}


+(BikingHistory *)sharedBikingHistory;
{
    @synchronized(self)
    {
        if (_bikingHistoryInfo == nil)
        {
            _bikingHistoryInfo = [[BikingHistory alloc] init];
        }
        
        return _bikingHistoryInfo;
    }
}
@end
