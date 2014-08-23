//
//  BikingStatusViewController.m
//  iBiking
//
//  Created by shangze_mac_20131209 on 14-8-20.
//  Copyright (c) 2014年 Geeko. All rights reserved.
//

#import "BikingStatusViewController.h"
#import "AppDelegate.h"
#import "SysStatus.h"
#import "BMapKit.h"
#import "AppDelegate.h"

@interface BikingStatusViewController ()
{
    SpeedInfoUnit *speedInfo;
}
@end

@implementation BikingStatusViewController
@synthesize NowHighLabel;
@synthesize NowSpeedLabel;
@synthesize AvgSpeedLabel;
@synthesize BikingDistanceLabel;
@synthesize BikingTimeLabel;
@synthesize StartStopButton;
@synthesize MapView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    speedInfo = [SysStatus sharedSpeedInfo];
    [speedInfo addObserver:self forKeyPath:@"TotalSeconds"
                   options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld  context:nil];
    [speedInfo addObserver:self forKeyPath:@"Distance" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld  context:nil];
    [speedInfo addObserver:self forKeyPath:@"NowSpeed" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld  context:nil];
    [speedInfo addObserver:self forKeyPath:@"AvgSpeed" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld  context:nil];
    [speedInfo addObserver:self forKeyPath:@"MaxSpeed" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld  context:nil];
    [speedInfo addObserver:self forKeyPath:@"AvgMinatesPerKm"
                   options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld  context:nil];
    [speedInfo addObserver:self forKeyPath:@"BikingStatus"
                   options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld  context:nil];
    [speedInfo addObserver:self forKeyPath:@"LastLocation"
                   options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld  context:nil];
    
    [MapView showsUserLocation];
    MapView.zoomLevel = 19;
    MapView.showMapScaleBar = TRUE;
    
    
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(void)viewDidAppear:(BOOL)animated
{
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [MapView viewWillAppear];
    MapView.delegate = self;
    
    AppDelegate *delegate = APP;
    [delegate HideTabBar];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [MapView viewWillAppear];
    MapView.delegate = self;
}

-(IBAction)Func_StartStopButtonAction
{
    AppDelegate *delegate = APP;
    MotionManager *motionManager = delegate.motionManager ;
    
    BikingStatus status = [SysStatus sharedSpeedInfo].BikingStatus;
    if (status == Start) {
        [motionManager Stop];
        [self.StartStopButton setTitle:@"启动" forState:UIControlStateNormal];
        [self.StartStopButton setSelected:NO];
    }
    else if(status == Ready ||status == Stop) {
        [motionManager StartWithRecord];
        [self.StartStopButton setTitle:@"暂停" forState:UIControlStateNormal];
        [self.StartStopButton setSelected:NO];
    }
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if([keyPath isEqualToString:@"TotalSeconds"])
    {
        BikingTimeLabel.text = [NSString stringWithFormat:@"%d ",speedInfo.TotalSeconds];
    }
    else if([keyPath isEqualToString:@"Distance"])
    {
        NowSpeedLabel.text = [NSString stringWithFormat:@"%0.1f",speedInfo.Distance];
    }
    else if([keyPath isEqualToString:@"NowSpeed"])
    {
        NowSpeedLabel.text = [NSString stringWithFormat:@"%0.1f",speedInfo.NowSpeed];
    }
    else if([keyPath isEqualToString:@"AvgSpeed"])
    {
        AvgSpeedLabel.text = [NSString stringWithFormat:@"%0.1f",speedInfo.AvgSpeed];
    }
    else if([keyPath isEqualToString:@"MaxSpeed"])
    {
//        MaxSpeedLabel.text = [NSString stringWithFormat:@"%f",speedInfo.MaxSpeed];
    }
    else if([keyPath isEqualToString:@"BikingStatus"])
    {
        
    }
    else if([keyPath isEqualToString:@"LastLocation"])
    {
        CLLocationDistance distance =speedInfo.LastLocation.altitude;
        NowHighLabel.text = [NSString stringWithFormat:@"%0.1f",distance];
        [MapView setCenterCoordinate:speedInfo.LastLocation.coordinate];
        BikingHistory *history = [SysStatus sharedBikingHistory];
        if (history.KeyBikingLocations == nil) {
            history.KeyBikingLocations = [NSMutableArray arrayWithCapacity:1];
        }
        
//        CLLocationCoordinate2D point =speedInfo.LastLocation.coordinate;

        [history.KeyBikingLocations addObject:speedInfo.LastLocation];
        
        
        CLLocationCoordinate2D commuterLotCoords[[history.KeyBikingLocations count]];
        for (int i=0; i<[history.KeyBikingLocations count]; i++)
        {
            CLLocation *aaxx = [history.KeyBikingLocations objectAtIndex:i];
            CLLocationCoordinate2D aa =[aaxx coordinate];
            commuterLotCoords[i] = aa;
        }
        
        BMKPolyline* polyline = [BMKPolyline polylineWithCoordinates:commuterLotCoords count:[history.KeyBikingLocations count] ];

        
        [MapView addOverlay:polyline];
        
        
    }
}


- (BMKOverlayView *)mapView:(BMKMapView *)mapView viewForOverlay:(id <BMKOverlay>)overlay{
    if ([overlay isKindOfClass:[BMKPolyline class]]){
        BMKPolylineView* polylineView = [[BMKPolylineView alloc] initWithOverlay:overlay] ;
        polylineView.strokeColor = [[UIColor purpleColor] colorWithAlphaComponent:1];
        polylineView.lineWidth = 2.0;
        
        return polylineView;
    }
    return nil;
}
@end
