//
//  MeViewController.h
//  iBiking
//
//  Created by shangze_mac_20131209 on 14-8-23.
//  Copyright (c) 2014年 Geeko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MeViewController : UIViewController
{
    
}

@property(nonatomic,retain) IBOutlet UIImageView *BackgroudImageView;
@property(nonatomic,retain) IBOutlet UIImageView *HeaderIconImageView;
@property(nonatomic,retain) IBOutlet UILabel *NickNameLabel;
@property(nonatomic,retain) IBOutlet UILabel *LocationLabel;
@property(nonatomic,retain) IBOutlet UILabel *RemarkLabel;

@property(nonatomic,retain) IBOutlet UILabel *FriendsCountLabel;
@property(nonatomic,retain) IBOutlet UILabel *FollowerCountLabel;
@property(nonatomic,retain) IBOutlet UILabel *FollowingCountLabel;
@property(nonatomic,retain) IBOutlet UILabel *ClubsCountLabel;


@property(nonatomic,retain) IBOutlet UITableView *UsersFuncTableView;
@end
