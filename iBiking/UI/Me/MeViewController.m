//
//  MeViewController.m
//  iBiking
//
//  Created by shangze_mac_20131209 on 14-8-23.
//  Copyright (c) 2014年 Geeko. All rights reserved.
//

#import "MeViewController.h"

@interface MeViewController ()

@end

@implementation MeViewController



@synthesize BackgroudImageView;
@synthesize HeaderIconImageView;
@synthesize NickNameLabel;
@synthesize LocationLabel;
@synthesize RemarkLabel;

@synthesize FriendsCountLabel;
@synthesize FollowerCountLabel;
@synthesize FollowingCountLabel;
@synthesize ClubsCountLabel;


@synthesize UsersFuncTableView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}


- (NSString *)iconImageName {
	return @"tab-mine.png";
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"我";
    
    HeaderIconImageView.image = [UIImage imageNamed:@"UserHeader-1.jpg"];
    BackgroudImageView.image = [UIImage imageNamed:@"Background-1.jpg"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


@end
