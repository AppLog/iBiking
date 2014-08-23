//
//  iOS7Adapter.h
//  iHome
//
//  Created by Chen Shengzhi on 13-12-31.
//  Copyright (c) 2013年 com.9tong. All rights reserved.
//

#import <Foundation/Foundation.h>

#define IsIOS7 ([[[[UIDevice currentDevice] systemVersion] substringToIndex:1] intValue]>=7)
#define CGRECT_NO_NAV(x,y,w,h) CGRectMake((x), (y+(IsIOS7?20:0)), (w), (h))
#define CGRECT_HAVE_NAV(x,y,w,h) CGRectMake((x), (y+(IsIOS7?64:0)), (w), (h))

#define CGRECT_NO_NAV_FRAME(rect) CGRectMake((rect.origin.x), (rect.origin.y+(IsIOS7?20:0)), (rect.size.width), (rect.size.height))
#define CGRECT_HAVE_NAV_FRAME(rect) CGRectMake(((rect.origin.x)), (rect.origin.y+(IsIOS7?64:0)), (rect.size.width), (rect.size.height))


#define IOS7_OR_LATER   ( [[[UIDevice currentDevice] systemVersion] compare:@"7.0"] != NSOrderedAscending )
#define DEVICE_IS_IPHONE5 ([[UIScreen mainScreen] bounds].size.height == 568)

#define UICOLOR_NAVIGATIONSTATUSBAR           [UIColor colorWithRed:167./255. green:166./255. blue:72./255. alpha:1.0]

#define IOS7 if([[[[UIDevice currentDevice] systemVersion] substringToIndex:1] intValue]>=7)\
{       self.extendedLayoutIncludesOpaqueBars = NO;\
        self.edgesForExtendedLayout = UIRectEdgeBottom | UIRectEdgeLeft | UIRectEdgeRight;\
}

@interface iOS7Adapter : NSObject
void IOS7ToIOS6ofFrame(UIViewController *vc);
void IOS7ToIOS6ofBounds(UIViewController *vc);

+(void)SetSubViewExternNone:(UIViewController *)viewController;
+(UIView *)Func_GetStatusBarBackView;
@end
