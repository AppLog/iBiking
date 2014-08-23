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
#import "BikingIndexViewController.h"
#import "MobClick.h"
#import "BCTabBarController.h"
#import "CRNavigationController.h"

@implementation AppDelegate
@synthesize motionManager;
@synthesize SelectedTabIndex;
@synthesize tabBarController;
@synthesize NavBikingUI;
@synthesize NavDiscoveryUI;
@synthesize NavMapsUI;
@synthesize NavMeUI;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSUncaughtExceptionHandler uncaughtExceptionHandler;
    NSSetUncaughtExceptionHandler(&uncaughtExceptionHandler);
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    [self Func_InitThirdParts];
    [self Func_InitSystem];
    [self Func_InitUI];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

-(void)Func_InitSystem
{
    _myCondition = [[NSCondition alloc] init];
    
    self.sysConfig = [[SysConfig alloc] init];
    
    DatabaseManager *manager = [[DatabaseManager alloc] init];
    [manager CheckDbSystem];
    
    
    self.motionManager = [MotionManager sharedInstance];
    motionManager.distanceFilter = 5.0f;
    motionManager.desiredAccuracy = kCLLocationAccuracyBest;
    motionManager.recordDelegate = [ActionManager sharedActionManager];
    motionManager.speedDelegate = [ActionManager sharedActionManager];
    
}

-(void)Func_InitUI
{
    if(tabBarController )
    {
        tabBarController = nil;
    }
    tabBarController = [[BCTabBarController alloc] init];
    
    self.tabBarController.selectedIndex = 0;
    self.tabBarController.bctabBarDelegate = self;
    
    
    NSArray *niblets = [[NSBundle mainBundle] loadNibNamed:@"BikingIndexViewController" owner:self options:NULL];
    for (id theObject in niblets)
    {
        if ([theObject isKindOfClass:[UIViewController class]])
        {
            bikingIndexViewController = (BikingIndexViewController *)theObject;
        }
    }
    
    if(NavBikingUI )
    {
        NavBikingUI = nil;
    }
    
    self.NavBikingUI = [[CRNavigationController alloc] initWithRootViewController:bikingIndexViewController];
    NavBikingUI.navigationBar.barStyle =UIBarStyleDefault;
    NavBikingUI.view.frame  = CGRectMake(0, 0, APP_FRAME.size.width, WIN_FRAME.size.height);
    NavBikingUI.delegate = self;
    
    NavBikingUI.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                                     [UIColor darkGrayColor] ,NSForegroundColorAttributeName,
                                                     [UIFont systemFontOfSize:22] ,NSFontAttributeName,nil];
    
    
    niblets = [[NSBundle mainBundle] loadNibNamed:@"OfflineMapViewController" owner:self options:NULL];
    for (id theObject in niblets)
    {
        if ([theObject isKindOfClass:[UIViewController class]])
        {
            offlineViewController = (OfflineMapViewController *)theObject;
        }
    }
    
    if(NavDiscoveryUI )
    {
        NavDiscoveryUI = nil;
    }
    
    self.NavDiscoveryUI = [[CRNavigationController alloc] initWithRootViewController:offlineViewController];
    NavDiscoveryUI.navigationBar.barStyle =UIBarStyleDefault;
    NavDiscoveryUI.view.frame  = CGRectMake(0, 0, APP_FRAME.size.width, WIN_FRAME.size.height);
    NavDiscoveryUI.delegate = self;
    
    NavDiscoveryUI.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                                     [UIColor darkGrayColor] ,NSForegroundColorAttributeName,
                                                     [UIFont systemFontOfSize:22] ,NSFontAttributeName,nil];
    
    
    niblets = [[NSBundle mainBundle] loadNibNamed:@"MeViewController" owner:self options:NULL];
    for (id theObject in niblets)
    {
        if ([theObject isKindOfClass:[UIViewController class]])
        {
            meViewController = (MeViewController *)theObject;
        }
    }
    
    if(NavMeUI )
    {
        NavMeUI = nil;
    }
    
    self.NavMeUI = [[CRNavigationController alloc] initWithRootViewController:meViewController];
    NavMeUI.navigationBar.barStyle =UIBarStyleDefault;
    NavMeUI.view.frame  = CGRectMake(0, 0, APP_FRAME.size.width, WIN_FRAME.size.height);
    NavMeUI.delegate = self;
    
    NavMeUI.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                                        [UIColor darkGrayColor] ,NSForegroundColorAttributeName,
                                                        [UIFont systemFontOfSize:22] ,NSFontAttributeName,nil];
    
    

    
	tabBarController.viewControllers = [NSArray arrayWithObjects:NavBikingUI,NavDiscoveryUI,NavMeUI,nil];
	tabBarController.selectedIndex = 0;
	[self.window addSubview:tabBarController.view];
    
    
    /*
    NSArray *niblets = [[NSBundle mainBundle] loadNibNamed:@"BikingIndexViewController" owner:self options:NULL];
    for (id theObject in niblets)
    {
        if ([theObject isKindOfClass:[UIViewController class]])
        {
            BikingStatusViewController *detailViewController = (BikingStatusViewController *)theObject;
            self.window.rootViewController = detailViewController;
            
            BikingIndexViewController *detailViewController = (BikingIndexViewController *)theObject;
            self.window.rootViewController = detailViewController;
        }
    }
    */
    
    /*
    //    NSArray *niblets = [[NSBundle mainBundle] loadNibNamed:@"OfflineMapViewController" owner:self options:NULL];
    //    for (id theObject in niblets)
    //    {
    //        if ([theObject isKindOfClass:[UIViewController class]])
    //        {
    //            OfflineMapViewController *detailViewController = (OfflineMapViewController *)theObject;
    //            self.window.rootViewController = detailViewController;
    //        }
    //    }
     */
}

-(void)Func_InitThirdParts
{
    //友盟，channelId:nil表示appstore
    if([CPId isEqualToString:@"1"])
        [MobClick startWithAppkey:@"524a245c56240b84ff0d0a39" reportPolicy:REALTIME channelId:nil];
    else if([CPId isEqualToString:@"2"])
        [MobClick startWithAppkey:@"524a245c56240b84ff0d0a39" reportPolicy:REALTIME channelId:@"91store"];
    
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


-(BOOL)NavigationHasBeenPushed:(UINavigationController*)_nav vc:(Class)_vc;
{
    for(int i=0;i<[_nav.viewControllers count];i++)
    {
        UIViewController *vc = [_nav.viewControllers objectAtIndex:i];
        if([vc isKindOfClass:[_vc class]])
            return YES;
    }
    return NO;
}


- (void)reachabilityChanged:(NSNotification *)note {
    Reachability* curReach = [note object];
    NSParameterAssert([curReach isKindOfClass: [Reachability class]]);
    netStatus = [curReach currentReachabilityStatus];
    
    if (netStatus == NotReachable) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:TIP_MESSAGE_TITLE
                                                        message:@"你的网络似乎无法联通！"
                                                       delegate:nil
                                              cancelButtonTitle:@"YES" otherButtonTitles:nil];
        [alert show];
    }
}

- (void)tabBar:(BCTabBar *)aTabBar didSelectTabAtIndex:(NSInteger)index;
{
    SLOG(@"tabBar didSelectTabAtIndex:%d",index);
    SelectedTabIndex = index;
}


-(void)HideTabBar
{
    if(tabBarController.tabBar.hidden==NO)
    {
        tabBarController.tabBar.frame = CGRectMake(0, 0, 0, 0);
        tabBarController.tabBar.bounds = CGRectMake(0, 0, 0, 0);
        tabBarController.tabBar.hidden = YES;
    }
}

-(void)ShowTabBar
{
    tabBarController.tabBar.hidden = NO;
    tabBarController.tabBar.frame = CGRectMake(0, APP_FRAME.size.height - 57, APP_FRAME.size.width, 57);
    tabBarController.tabBar.bounds = CGRectMake(0, 0, APP_FRAME.size.width, 57);
}


-(void)LockMe
{
    [_myCondition lock];
}

-(void)UnLockMe
{
    [_myCondition unlock];
}




void uncaughtExceptionHandler(NSException *exception)
{
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:
                          exception, @"错误原因", nil];
    [MobClick event:@"未捕获的错误" attributes:dict];
}
@end
