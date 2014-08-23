//
//  OfflineMapViewController.h
//  iBiking
//
//  Created by shangze_mac_20131209 on 14-8-20.
//  Copyright (c) 2014年 Geeko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BMapKit.h"

@interface OfflineMapViewController : UIViewController<BMKMapViewDelegate,BMKOfflineMapDelegate,UITableViewDataSource,UITableViewDelegate>
{
    IBOutlet BMKMapView* _mapView;
    BMKOfflineMap* _offlineMap;
    NSArray* _arrayHotCityData;//热门城市
    NSMutableArray * _arraylocalDownLoadMapInfo;//本地下载的离线地图
    IBOutlet UITableView* groupTableView;
    NSArray* _arrayOfflineCityData;//全国支持离线地图的城市

}
@end
