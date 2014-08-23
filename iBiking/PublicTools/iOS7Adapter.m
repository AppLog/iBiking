//
//  iOS7Adapter.m
//  iHome
//
//  Created by Chen Shengzhi on 13-12-31.
//  Copyright (c) 2013年 com.9tong. All rights reserved.
//

#import "iOS7Adapter.h"
#import <UIKit/UIKit.h>



@implementation iOS7Adapter

void IOS7ToIOS6ofFrame(UIViewController *vc)
{
    if (IsIOS7) {
        CGRect rect = vc.view.frame;
        vc.view.frame = CGRectMake((rect.origin.x), (rect.origin.y+(IsIOS7?vc.topLayoutGuide.length:0)), (CGRectGetWidth(rect)), (CGRectGetHeight(rect)-(IsIOS7?vc.topLayoutGuide.length:0)));
    }
}

void IOS7ToIOS6ofBounds(UIViewController *vc)
{
    if (IsIOS7) {
        CGRect rect = vc.view.bounds;
        if (rect.origin.y != -1*vc.topLayoutGuide.length) {
            vc.view.bounds = CGRectMake((rect.origin.x), (rect.origin.y+(IsIOS7?vc.topLayoutGuide.length*(-1):0)), (CGRectGetWidth(rect)), (CGRectGetHeight(rect)));
        }
    }
}

+(void)SetSubViewExternNone:(UIViewController *)viewController
{
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 70000
    if ( IOS7_OR_LATER )
    {
        viewController.edgesForExtendedLayout = UIRectEdgeBottom | UIRectEdgeLeft | UIRectEdgeRight;
        viewController.extendedLayoutIncludesOpaqueBars = NO;
        viewController.modalPresentationCapturesStatusBarAppearance = NO;
        viewController.navigationController.navigationBar.translucent = NO;
    }
#endif  // #if __IPHONE_OS_VERSION_MAX_ALLOWED >= 70000
}

//状态栏背景视图
+(UIView *)Func_GetStatusBarBackView
{
    if (IsIOS7) {
        CGRect rectStatus = CGRectMake(0, 0, 320, 20);
        UIView *viewStatusBg = [[UIView alloc] initWithFrame:rectStatus] ;
        viewStatusBg.backgroundColor = UICOLOR_NAVIGATIONSTATUSBAR;
        return viewStatusBg;
    }
    else
    {
        return nil;
    }
}
@end
