#import "BCTabBar.h"
@class BCTabBarView;

@interface BCTabBarController : UIViewController <BCTabBarDelegate> {
	NSArray *viewControllers;

	BCTabBar *tabBar;
	BCTabBarView *tabBarView;
	BOOL visible;
    id <BCTabBarDelegate> bctabBarDelegate;
}

@property (nonatomic, retain) NSArray *viewControllers;
@property (nonatomic, retain) BCTabBar *tabBar;
@property (nonatomic, retain) UIViewController *selectedViewController;
@property (nonatomic, retain) BCTabBarView *tabBarView;
@property (nonatomic) NSUInteger selectedIndex;
@property (nonatomic, retain) id <BCTabBarDelegate> bctabBarDelegate;

@end
