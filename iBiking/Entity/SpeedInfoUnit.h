//
//  SpeedInfoUnit.h
//  iBiking
//
//  Created by shangze_mac_20131209 on 14-8-4.
//  Copyright (c) 2014年 Geeko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SysEnums.h"

@interface SpeedInfoUnit : NSObject
{
    
}

@property(nonatomic,assign) int TotalSeconds;
@property(nonatomic,retain) NSString *TotalSecondsDescription;
@property(nonatomic,assign) float Distance;
@property(nonatomic,assign) float NowSpeed;
@property(nonatomic,assign) float AvgSpeed;
@property(nonatomic,assign) float MaxSpeed;
@property(nonatomic,assign) float AvgMinatesPerKm;
@property(nonatomic,assign) float MaxHigh;
@property(nonatomic,assign) float MinHigh;
@property(nonatomic,assign) float ToUpperHigh;
@property(nonatomic,assign) float ToLowerHigh;
@property(nonatomic,assign) float ToUpperDistance;
@property(nonatomic,assign) float ToLowerDistance;
@property(nonatomic,assign) BikingStatus BikingStatus;
@property(nonatomic,retain) CLLocation *LastLocation;



@end
