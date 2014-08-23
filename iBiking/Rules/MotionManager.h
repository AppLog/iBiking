//
//  MotionManager.h
//  iBiking
//
//  Created by shangze_mac_20131209 on 14-7-30.
//  Copyright (c) 2014年 Geeko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import "IRecordingDelegate.h"
#import "ISpeedDelegate.h"
#import "BMapKit.h"

@interface MotionManager : NSObject<CLLocationManagerDelegate,IRecordingDelegate,BMKLocationServiceDelegate>
{
    
}
@property(nonatomic,assign) float distanceFilter;
@property(nonatomic,assign) CLLocationAccuracy desiredAccuracy;
@property(nonatomic,retain) id<IRecordingDelegate> recordDelegate;
@property(nonatomic,retain) id<ISpeedDelegate> speedDelegate;


+(MotionManager *) sharedInstance;

-(void)Start;
-(void)StartWithRecord;
-(void)Stop;
@end
