@class BCTabBar;

@interface BCTabBarView : UIView {
	UIView *contentView;
	BCTabBar *tabBar;
}

@property (nonatomic, retain) UIView *contentView;
@property (nonatomic, assign) BCTabBar *tabBar;
-(void)removeLastView;
-(void)addCurrentView;

@end
