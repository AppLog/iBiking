//
//  AppDelegate.h
//  iBiking
//
//  Created by shangze_mac_20131209 on 14-7-17.
//  Copyright (c) 2014年 Geeko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BMapKit.h"
#import "BCTabBar.h"
#import "Reachability.h"
#import "BikingIndexViewController.h"
#import "OfflineMapViewController.h"
#import "MeViewController.h"


@class BCTabBarController;
@class Reachability;

@interface AppDelegate : UIResponder <UIApplicationDelegate,IRecordingDelegate,BCTabBarDelegate,UINavigationControllerDelegate,UIAlertViewDelegate>
{
    BMKMapManager* _mapManager;
    NSCondition *_myCondition;
    Reachability  *hostReach;
    NetworkStatus netStatus;
    BikingIndexViewController *bikingIndexViewController;
    OfflineMapViewController *offlineViewController;
    MeViewController *meViewController;
}
@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) MotionManager *motionManager;
@property (strong, nonatomic) SysConfig *sysConfig;

@property (nonatomic,assign) NSInteger SelectedTabIndex;
@property (nonatomic,retain) BCTabBarController *tabBarController;

@property (nonatomic,retain) UINavigationController *NavBikingUI;
@property (nonatomic,retain) UINavigationController *NavDiscoveryUI;
@property (nonatomic,retain) UINavigationController *NavMapsUI;
@property (nonatomic,retain) UINavigationController *NavMeUI;

-(void)HideTabBar;
-(void)ShowTabBar;

@end
