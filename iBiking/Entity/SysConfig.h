//
//  SysConfig.h
//  iBiking
//
//  Created by shangze_mac_20131209 on 14-8-5.
//  Copyright (c) 2014年 Geeko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SysConfig : NSObject
{
    
}

@property(nonatomic,retain) NSString *DBFullPath;
@property(nonatomic,retain) NSString *AppRootFullPath;
@property(nonatomic,retain) NSString *AppDocumentsFullPath;


@property(nonatomic,assign) BOOL *IsEnableAutoRecord;

@property(nonatomic,assign) BOOL *IsEnableRealTimeRecord;
@end
