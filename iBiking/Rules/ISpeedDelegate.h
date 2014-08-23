//
//  ISpeedDelegate.h
//  iBiking
//
//  Created by shangze_mac_20131209 on 14-7-30.
//  Copyright (c) 2014年 Geeko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@protocol ISpeedDelegate <NSObject>

@optional
-(void)didUpdateLocations:(NSArray *) locations;
-(void)didUpdateFromLocation:(CLLocation *) location toNewLocation:(CLLocation *) toNewLocation;
@end
