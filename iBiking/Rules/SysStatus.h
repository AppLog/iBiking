//
//  SysStatus.h
//  iBiking
//
//  Created by shangze_mac_20131209 on 14-8-4.
//  Copyright (c) 2014年 Geeko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SpeedInfoUnit.h"
#import "BikingHistory.h"

@interface SysStatus : NSObject

//返回当前骑行速度数据
+(SpeedInfoUnit *)sharedSpeedInfo;

//返回当天骑行对象数据
+(BikingHistory *)sharedBikingHistory;
@end
