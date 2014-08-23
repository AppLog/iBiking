//
//  SysConfig.m
//  iBiking
//
//  Created by shangze_mac_20131209 on 14-8-5.
//  Copyright (c) 2014年 Geeko. All rights reserved.
//

#import "SysConfig.h"

@implementation SysConfig
{
    
}

@synthesize AppDocumentsFullPath;
@synthesize AppRootFullPath;
@synthesize DBFullPath;

-(id)init
{
    self = [super init];
    if (self) {
        self.DBFullPath = [NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"Documents/%@",DATABASE_FILE_NAME]];
        self.AppRootFullPath = NSHomeDirectory();
        self.AppDocumentsFullPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
        
        if (DEBUG_VERSION) {
            NSLog(@"%@",self.AppRootFullPath);
        }
    }
    
    return self;
}
@end
