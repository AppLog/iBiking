//
//  SysEnums.h
//  iBiking
//
//  Created by shangze_mac_20131209 on 14-8-5.
//  Copyright (c) 2014年 Geeko. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum BikingStatus
{
    Ready,
    Start,
    Pause,
    Stop,
    AutoPause
    
} BikingStatus;

typedef enum SportsType
{
    None,
    Walking,
    Biking,
    Running
    
} SportsType;