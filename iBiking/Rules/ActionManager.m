//
//  ActionManager.m
//  iBiking
//
//  Created by shangze_mac_20131209 on 14-8-5.
//  Copyright (c) 2014年 Geeko. All rights reserved.
//

#import "ActionManager.h"
#import "BikingDetailInfo.h"
#import "SysStatus.h"



static ActionManager *_actionInstace;
@implementation ActionManager

+(ActionManager *) sharedActionManager
{
    @synchronized(self)
    {
        if (_actionInstace == nil) {
            _actionInstace = [[ActionManager alloc] init];
        }
        return _actionInstace;
    }
}

#pragma mark 记录经纬度逻辑
-(void)recordingWithLongitude:(float)longitude latitude:(float)latitude
{
//    NSString *sLog = [NSString stringWithFormat:@"经纬度：%f,%f\n",longitude,latitude];
//    NSError *errora ;
//    NSString *sName =  [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/Log.txt"];
//    [sLog writeToFile:sName atomically:FALSE encoding:NSUTF8StringEncoding error:&errora];
    
    NSString *sDateTime = [[NSDate date] description];
    
    BikingHistory *historyInstance = [SysStatus sharedBikingHistory];
    if (historyInstance.ID ==0) {
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd"];
        NSString *currentDateStr = [dateFormatter stringFromDate:[NSDate date]];
        historyInstance.Date = currentDateStr;
        
        
        BikingHistory *tempInstance = [BikingHistory GetHistoryInstanceByDate:currentDateStr];
        
        if (tempInstance == nil ||tempInstance.ID ==0) {
            historyInstance = [SysStatus sharedBikingHistory];
            historyInstance.ID = [BikingHistory GetMaxHistoryId]+1;
            historyInstance.Date = currentDateStr;
            historyInstance.StartDateTime = [[NSDate date] description];
            
            [BikingHistory Add:historyInstance];
        }
        else
        {
            historyInstance.ID = tempInstance.ID;
            historyInstance.Date = tempInstance.Date;
            historyInstance.StartDateTime = tempInstance.StartDateTime;
            historyInstance.BikingTotal = tempInstance.BikingTotal;
            historyInstance.BikingTime = tempInstance.BikingTime;
        }
    }
    
    
    
    BikingDetailInfo *detail = [[BikingDetailInfo alloc] init];
    detail.BikingHistoryId = historyInstance.ID;
    detail.DateTime = sDateTime;
    detail.Longitude = longitude;
    detail.Latitude = latitude;
    detail.Remark = @"";
    [BikingDetailInfo Add:detail];
    
}


-(void)didUpdateLocations:(NSArray *) locations
{
    if (!locations) {
        return;
    }
    
    SpeedInfoUnit *speedInfo = [SysStatus sharedSpeedInfo];
    CLLocation *currentLocation = [locations lastObject];
    CLLocation *lastLocation = [SysStatus sharedSpeedInfo].LastLocation;
    if (currentLocation.horizontalAccuracy < kCLLocationAccuracyHundredMeters) {
        if (lastLocation) {
            CGFloat distance = [currentLocation distanceFromLocation:lastLocation];
            if (distance <2) {
                //小于两米的路程给忽略掉
                return;
            }
            NSLog(@"%@",[NSDate date]);
            
            NSLog(@"current TimeStamp:%@",currentLocation.timestamp);
            NSLog(@"Last TimeStamp:%@",lastLocation.timestamp);
            NSTimeInterval dTime = [currentLocation.timestamp timeIntervalSinceDate:lastLocation.timestamp];
            speedInfo.TotalSeconds += dTime;
            

            CGFloat currentSpeed = 0;
            CGFloat avgSpeed = 0;
            speedInfo.Distance += distance;
            if (dTime == 0 ) {
                currentSpeed = 0;
                if (speedInfo.TotalSeconds ==0) {
                    avgSpeed = 0;
                }
                else
                {
                    avgSpeed = speedInfo.Distance / speedInfo.TotalSeconds *3.6;
                }
            }
            else
            {
                currentSpeed = distance / dTime *3.6;
                avgSpeed = speedInfo.Distance / speedInfo.TotalSeconds *3.6;
            }
            
            if (currentSpeed>60 ||currentSpeed<0) {
                //平均速度大于60，当前值有异常,忽略
                return;
            }
            
            speedInfo.Distance += distance;
            speedInfo.AvgSpeed = avgSpeed;
            speedInfo.TotalSeconds += dTime;
            speedInfo.NowSpeed = currentSpeed;
            
            if (currentSpeed > speedInfo.MaxSpeed) {
                speedInfo.MaxSpeed = currentSpeed;
            }
            
            BikingHistory *bikingHistory = [SysStatus sharedBikingHistory];
            bikingHistory.BikingTime += dTime;
            bikingHistory.BikingTotal += distance;
            
            
            BikingHistorySaveCount += 1;
            if (BikingHistorySaveCount == BIKINGHISTORYSAVECOUNT) {
                [BikingHistory Update:bikingHistory];
                BikingHistorySaveCount = 0;
            }
            
        }
        speedInfo.LastLocation = currentLocation;
    }
    
}
-(void)didUpdateFromLocation:(CLLocation *) location toNewLocation:(CLLocation *) toNewLocation
{
    
}

@end
