//
//  MotionManager.m
//  iBiking
//
//  Created by shangze_mac_20131209 on 14-7-30.
//  Copyright (c) 2014年 Geeko. All rights reserved.
//

#import "MotionManager.h"
#import "SysStatus.h"
#import "BMapKit.h"

static MotionManager *manager;

@implementation MotionManager
{
    CLLocationManager *locationMgr;
    BMKLocationService *_locService;
    BOOL IsNeedRecord ;
    BOOL IsRecording;
}
@synthesize recordDelegate;
@synthesize speedDelegate;

- (id)init
{
    @synchronized(self) {
        self = [super init];
        
        BOOL bIsEnable = [CLLocationManager locationServicesEnabled];
        if (bIsEnable) {
            CLAuthorizationStatus status = [CLLocationManager authorizationStatus];
            if (status == kCLAuthorizationStatusRestricted  ||status == kCLAuthorizationStatusDenied) {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"获取当前位置失败" message:@"请进入iPhone的“设置>隐私>定位服务”选项，允许“骑客”的访问你的位置信息。" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil] ;
                [alert show];
            }
            else
            {
                if (SYSTEMLOCATIONSERVICETYPE == 1) {
                    locationMgr = [[CLLocationManager alloc] init] ;
                    locationMgr.delegate=self;
                    locationMgr.desiredAccuracy=kCLLocationAccuracyBest;
                }
                else
                {
                    _locService = [[BMKLocationService alloc]init];
                    _locService.delegate = self;
                }
                
            }
        }
        else
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"获取当前位置失败" message:@"请进入iPhone的“设置>隐私>定位服务”选项，启用定位服务，并允许“骑客”的访问你的位置信息。" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil] ;
            [alert show];
        }
        
        return self;
    }
}

+(MotionManager *) sharedInstance
{
    @synchronized(self)
    {
        if (manager == nil) {
            manager = [[MotionManager alloc] init];
        }
    }
    return manager;
}

-(void)Start
{
    if (SYSTEMLOCATIONSERVICETYPE == 1) {
        if (!locationMgr) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"获取当前位置失败" message:@"请进入iPhone的“设置>隐私>定位服务”选项，启用定位服务，并允许“骑客”的访问你的位置信息。" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil] ;
            [alert show];
            return;
        }
        locationMgr.desiredAccuracy =kCLLocationAccuracyBest;
        locationMgr.distanceFilter  = 1.0f;
        
        [locationMgr startUpdatingLocation];
    }
    else if(SYSTEMLOCATIONSERVICETYPE == 2)
    {
        if (!_locService) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"获取当前位置失败" message:@"请进入iPhone的“设置>隐私>定位服务”选项，启用定位服务，并允许“骑客”的访问你的位置信息。" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil] ;
            [alert show];
            return;
        }
        [_locService startUserLocationService];
    }
    
    [SysStatus sharedSpeedInfo].BikingStatus = Start;
}

-(void)StartWithRecord
{
    IsNeedRecord = true;
    [self Start];
}

-(void)Stop
{
    if (SYSTEMLOCATIONSERVICETYPE == 1) {
        [locationMgr stopUpdatingLocation];
    }
    else if(SYSTEMLOCATIONSERVICETYPE == 2)
    {
        [_locService stopUserLocationService];
    }
    
    [SysStatus sharedSpeedInfo].BikingStatus = Stop;
}

#pragma mark 系统地图定位
- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation{

    if (IsNeedRecord) {
        if (recordDelegate) {
            if ([recordDelegate respondsToSelector:@selector(recordingWithLongitude:latitude:)]) {
                [recordDelegate recordingWithLongitude:newLocation.coordinate.longitude latitude:newLocation.coordinate.latitude];
            }
        }
    }
    
    if (speedDelegate) {
        if ([speedDelegate respondsToSelector:@selector(recordingWithLongitude:latitude:)]) {
            [speedDelegate didUpdateLocations:[NSArray arrayWithObject:newLocation]];
        }
    }
}

-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    
}

-(void)locationManagerDidPauseLocationUpdates:(CLLocationManager *)manager
{
    
}

-(void)locationManagerDidResumeLocationUpdates:(CLLocationManager *)manager
{
    
}


#pragma mark 百度地图
//处理方向变更信息
- (void)didUpdateUserHeading:(BMKUserLocation *)userLocation
{
    
}
//处理位置坐标更新
- (void)didUpdateUserLocation:(BMKUserLocation *)userLocation
{
    if (IsNeedRecord) {
        if (recordDelegate) {
            if ([recordDelegate respondsToSelector:@selector(recordingWithLongitude:latitude:)]) {
                [recordDelegate recordingWithLongitude:userLocation.location.coordinate.longitude latitude:userLocation.location.coordinate.latitude];
            }
        }
    }
    
    if (speedDelegate) {
        if ([speedDelegate respondsToSelector:@selector(recordingWithLongitude:latitude:)]) {
            [speedDelegate didUpdateLocations:[NSArray arrayWithObject:userLocation.location]];
        }
    }
}
@end
