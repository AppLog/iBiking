//
//  IWebAction.h
//  joyoungMag
//
//  Created by zhangyin on 4/28/11.
//  Copyright 2011 cmf. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol IWebAction <NSObject>

-(void)OnSwipeRightAction;
-(void)OnSwipeLeftAction;

-(void)btFavoriteClick:(NSInteger)_pageIndex;

-(void)btShareClick:(NSInteger)_pageIndex;

-(void)btProductClick:(NSInteger)_pageIndex;

-(void)btBuyClick:(NSInteger)_pageIndex;

-(void)OnWebTouchesBegan:(CGPoint)touchPoint;
-(void)OnWebTouchesMove:(CGPoint)touchPoint;
-(void)OnWebTouchesEnd:(CGPoint)touchPoint;

-(void)OnLinkClicked:(NSString*)_urlstr;

-(void)OnWebPageLoadFinished;

//返回按钮被点击
-(void)btBackClick:(NSInteger) _pageIndex;

@end
