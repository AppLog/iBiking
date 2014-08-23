//
//  IRecordingDelegate.h
//  iBiking
//
//  Created by shangze_mac_20131209 on 14-7-30.
//  Copyright (c) 2014年 Geeko. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol IRecordingDelegate <NSObject>

@optional
-(void)recordingWithLongitude:(float ) longitude latitude:(float )latitude;
@end
