//
//  AppDelegate.h
//  iBiking
//
//  Created by shangze_mac_20131209 on 14-7-17.
//  Copyright (c) 2014年 Geeko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BMapKit.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate,IRecordingDelegate>
{
    BMKMapManager* _mapManager;
}
@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) MotionManager *motionManager;
@property (strong, nonatomic) SysConfig *sysConfig;

@end
