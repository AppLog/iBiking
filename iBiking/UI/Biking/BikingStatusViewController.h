//
//  BikingStatusViewController.h
//  iBiking
//
//  Created by shangze_mac_20131209 on 14-8-20.
//  Copyright (c) 2014年 Geeko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BMapKit.h"

@interface BikingStatusViewController : UIViewController<BMKMapViewDelegate>
{
    
}

@property (nonatomic,retain) IBOutlet UILabel *NowSpeedLabel;
@property (nonatomic,retain) IBOutlet UILabel *AvgSpeedLabel;
@property (nonatomic,retain) IBOutlet UILabel *BikingTimeLabel;
@property (nonatomic,retain) IBOutlet UILabel *NowHighLabel;
@property (nonatomic,retain) IBOutlet UILabel *BikingDistanceLabel;
@property (nonatomic,retain) IBOutlet UIButton *StartStopButton;
@property (nonatomic,retain) IBOutlet BMKMapView *MapView;

-(void)Func_StartStopButtonAction;
@end
