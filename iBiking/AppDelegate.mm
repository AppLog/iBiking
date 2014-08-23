//
//  AppDelegate.m
//  iBiking
//
//  Created by shangze_mac_20131209 on 14-7-17.
//  Copyright (c) 2014年 Geeko. All rights reserved.
//

#import "AppDelegate.h"
#import "SysConfig.h"
#import "DatabaseManager.h"
#import "BikingStatusViewController.h"
#import "BMapKit.h"
#import "OfflineMapViewController.h"

@implementation AppDelegate
@synthesize motionManager;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    [self Func_InitThirdParts];
    [self Func_Init];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

-(void)Func_Init
{
    self.sysConfig = [[SysConfig alloc] init];
    
    DatabaseManager *manager = [[DatabaseManager alloc] init];
    [manager CheckDbSystem];
    
    
    self.motionManager = [MotionManager sharedInstance];
    motionManager.distanceFilter = 5.0f;
    motionManager.desiredAccuracy = kCLLocationAccuracyBest;
    motionManager.recordDelegate = [ActionManager sharedActionManager];
    motionManager.speedDelegate = [ActionManager sharedActionManager];
    
    NSArray *niblets = [[NSBundle mainBundle] loadNibNamed:@"BikingStatusViewController" owner:self options:NULL];
    for (id theObject in niblets)
    {
        if ([theObject isKindOfClass:[UIViewController class]])
        {
            BikingStatusViewController *detailViewController = (BikingStatusViewController *)theObject;
            self.window.rootViewController = detailViewController;
        }
    }
   
//    NSArray *niblets = [[NSBundle mainBundle] loadNibNamed:@"OfflineMapViewController" owner:self options:NULL];
//    for (id theObject in niblets)
//    {
//        if ([theObject isKindOfClass:[UIViewController class]])
//        {
//            OfflineMapViewController *detailViewController = (OfflineMapViewController *)theObject;
//            self.window.rootViewController = detailViewController;
//        }
//    }

}

-(void)Func_InitThirdParts
{
    _mapManager = [[BMKMapManager alloc]init];
    BOOL ret = [_mapManager start:BAIDU_MAP_KEY  generalDelegate:nil];
    if (!ret) {
        NSLog(@"manager start failed!");
    }
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    
}




@end
