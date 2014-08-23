//
//  BikingIndexViewController.m
//  iBiking
//
//  Created by shangze_mac_20131209 on 14-8-23.
//  Copyright (c) 2014年 Geeko. All rights reserved.
//

#import "BikingIndexViewController.h"
#import "BikingStatusViewController.h"
#import "AppDelegate.h"

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


- (NSString *)iconImageName {
	return @"tab-sport.png";
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"运动";
    
    TableFuncIcons = [NSMutableArray arrayWithObjects:
                      @"sportview_sporthistory.png",
                      @"sportview_rank.png",
                      @"sportview_followlive.png",nil];
    
    TableFuncName = [NSMutableArray arrayWithObjects:
                      @"运动历史",
                      @"排行榜",
                      @"特别关注",nil];
    
    TableFuncSubName = [NSMutableArray arrayWithObjects:
                      @"骑行10.5KM,历时30:15",
                      @"月度排名125",
                      @"俞少离西藏还有268KM，离梦想又近了一步。",nil];
    
    TableFuncActionKeys = [NSMutableArray arrayWithObjects:
                        @"GoBikingHistoryList",
                        @"GoRankList",
                        @"GoSessions",nil];
    
    TableFuncActionParameters = [NSMutableArray arrayWithObjects:
                        @"",
                        @"",
                        @"",nil];
    
    TableFuncActionRemarks = [NSMutableArray arrayWithObjects:
                        @"",
                        @"",
                        @"",nil];
    
    TableFuncViewStyle = [NSMutableArray arrayWithObjects:
                        @2,
                        @2,
                        @2,nil];
    BikingTableView.dataSource = self;
    BikingTableView.delegate = self;
    [self setExtraCellLineHidden:BikingTableView];
}

-(void)setExtraCellLineHidden: (UITableView *)tableViewx
{
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor clearColor];
    [tableViewx setTableFooterView:view];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    AppDelegate *delegate = APP;
    [delegate ShowTabBar];
    
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
-(IBAction)Func_GoBiking
{
    NSArray *niblets = [[NSBundle mainBundle] loadNibNamed:@"BikingStatusViewController" owner:self options:NULL];
    for (id theObject in niblets)
    {
        if ([theObject isKindOfClass:[UIViewController class]])
        {
            BikingStatusViewController *bikingIndexViewController = (BikingStatusViewController *)theObject;
            [self.navigationController pushViewController:bikingIndexViewController animated:YES];
            [bikingIndexViewController Func_StartStopButtonAction];
        }
    }
}


#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [TableFuncName count];
}

-(float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 65;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"BikingFuncIdentifier";
//    static BOOL nibsRegistered = NO;
//    if (!nibsRegistered) {
//        UINib *nib = [UINib nibWithNibName:@"UITableViewCell" bundle:nil];
//        [tableView registerNib:nib forCellReuseIdentifier:CellIdentifier];
//        nibsRegistered = YES;
//    }
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
//        NSArray *arr = [[NSBundle mainBundle] loadNibNamed:@"UITableViewCell" owner:self options:nil];
//        if (arr) {
//            cell = [arr objectAtIndex:0];
//        }
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        UIView *view = [[ UIView alloc] init];
        view.backgroundColor = RGBCOLOR(240, 240, 240);
        cell.selectedBackgroundView  = view;
    }
    
    int nRow = indexPath.row;
    if (nRow >= [TableFuncName count]) {
        return nil;
    }
    cell.textLabel.text = [self.TableFuncName objectAtIndex:nRow];
    
    NSString *sSubName = @"";
    if (!TableFuncSubName ||[TableFuncSubName count]< nRow+1) {
        
    }
    else
    {
        sSubName = [TableFuncSubName objectAtIndex:nRow];
    }
    cell.detailTextLabel.text = sSubName;
    
    NSString *sIconName = @"";
    if (!TableFuncIcons ||[TableFuncIcons count]< nRow+1) {
    
    }
    else
    {
        sIconName = [TableFuncIcons objectAtIndex:nRow];
    }
    if (![sIconName isEqualToString:@""]) {
        cell.imageView.image = [UIImage imageNamed:sIconName];
    }
    
    cell.textLabel.textColor = RGBCOLOR(28,28, 28);
    cell.textLabel.font = [UIFont systemFontOfSize:18];
    cell.detailTextLabel.textColor = RGBCOLOR(98, 98, 98);
    cell.textLabel.font = [UIFont systemFontOfSize:15];
    return cell;
}
@end
