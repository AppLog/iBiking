//
//  BikingIndexViewController.h
//  iBiking
//
//  Created by shangze_mac_20131209 on 14-8-23.
//  Copyright (c) 2014年 Geeko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BikingIndexViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    
}
@property(nonatomic,retain) NSMutableArray  *TableFuncIcons;
@property(nonatomic,retain) NSMutableArray  *TableFuncName;
@property(nonatomic,retain) NSMutableArray  *TableFuncSubName;
@property(nonatomic,retain) NSMutableArray  *TableFuncActionKeys;
@property(nonatomic,retain) NSMutableArray  *TableFuncActionParameters;
@property(nonatomic,retain) NSMutableArray  *TableFuncActionRemarks;
@property(nonatomic,retain) NSMutableArray  *TableFuncViewStyle;


@property(nonatomic,retain) IBOutlet UILabel *TotalBikingDistanceLabel;
@property(nonatomic,retain) IBOutlet UILabel *WeatcherInfoLabel;
@property(nonatomic,retain) IBOutlet UITableView *BikingTableView;
@property(nonatomic,retain) IBOutlet UIButton *GoBikingButton;
@end
