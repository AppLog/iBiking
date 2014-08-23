//
//  BikingIndexViewController.m
//  iBiking
//
//  Created by shangze_mac_20131209 on 14-8-23.
//  Copyright (c) 2014年 Geeko. All rights reserved.
//

#import "BikingIndexViewController.h"

@interface BikingIndexViewController ()

@end

@implementation BikingIndexViewController
@synthesize TableFuncIcons;
@synthesize TableFuncName;
@synthesize TableFuncSubName;
@synthesize TableFuncActionKeys;
@synthesize TableFuncActionParameters;
@synthesize TableFuncActionRemarks;
@synthesize TableFuncViewStyle;

@synthesize TotalBikingDistanceLabel;
@synthesize WeatcherInfoLabel;
@synthesize BikingTableView;
@synthesize GoBikingButton;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    TableFuncIcons = [NSMutableArray arrayWithObjects:
                      @"BikingHistory.png"
                      @"RankList.png",
                      @"SpecialLike.png",nil];
    
    TableFuncName = [NSMutableArray arrayWithObjects:
                      @"运动历史"
                      @"排行榜",
                      @"特别关注",nil];
    
    TableFuncSubName = [NSMutableArray arrayWithObjects:
                      @"运动历史"
                      @"排行榜",
                      @"特别关注",nil];
    
    TableFuncActionKeys = [NSMutableArray arrayWithObjects:
                        @"GoBikingHistoryList"
                        @"GoRankList",
                        @"GoSessions",nil];
    
    TableFuncActionParameters = [NSMutableArray arrayWithObjects:
                        @""
                        @"",
                        @"",nil];
    
    TableFuncActionRemarks = [NSMutableArray arrayWithObjects:
                        @""
                        @"",
                        @"",nil];
    
    TableFuncViewStyle = [NSMutableArray arrayWithObjects:
                        @2,
                        @2,
                        @2,nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
}

//加载与绑定汇总数据
-(void)Func_LoadAndBindSummaryData
{
    
}

//加载天气信息给用户判断是否可以进行骑行活动
-(void)Func_LoadWeatherInfo
{
    
}

//开始骑行
-(void)Func_GoBiking
{
    
}


#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [TableFuncName count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Ride Record";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    
    return cell;
}
@end
