//
//  ActionManager.h
//  iBiking
//  骑行速度计算，轨迹记录控制器
//  Created by shangze_mac_20131209 on 14-8-5.
//  Copyright (c) 2014年 Geeko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MotionManager.h"

@interface ActionManager : NSObject<IRecordingDelegate,ISpeedDelegate>
{
    int BikingHistorySaveCount;
}

+(ActionManager *) sharedActionManager;
@end
