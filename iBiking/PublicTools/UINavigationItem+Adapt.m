//
//  UINavigationItem+Adapt.m
//  iHome
//
//  Created by shangze_mac_20131209 on 14-7-8.
//  Copyright (c) 2014年 com.9tong. All rights reserved.
//

#import "UINavigationItem+Adapt.h"
#import <UIKit/UIKit.h>

@implementation UINavigationItem (Adapt)

//用于处理iOS7导航栏左侧有15像素左右的区域无法点击的问题

#if __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_6_1
- (void)setLeftBarButtonItem:(UIBarButtonItem *)_leftBarButtonItem{
    UIBarButtonItem *spaceButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    spaceButtonItem.width = -15;
    if (_leftBarButtonItem){
        [self setLeftBarButtonItems:@[spaceButtonItem, _leftBarButtonItem]];
    }  else {
        [self setLeftBarButtonItems:@[spaceButtonItem]];
    }
}

- (void)setRightBarButtonItem:(UIBarButtonItem *)_rightBarButtonItem{
    UIBarButtonItem *spaceButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    spaceButtonItem.width = -15;
    if (_rightBarButtonItem) {
        [self setRightBarButtonItems:@[spaceButtonItem, _rightBarButtonItem]];
    } else   {
        [self setRightBarButtonItems:@[spaceButtonItem]];
    }
}
#endif
@end
