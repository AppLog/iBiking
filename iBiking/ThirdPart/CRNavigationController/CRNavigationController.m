//
//  CRNavigationController.m
//  CRNavigationControllerExample
//
//  Created by Corey Roberts on 9/24/13.
//  Copyright (c) 2013 SpacePyro Inc. All rights reserved.
//

#import "CRNavigationController.h"
#import "CRNavigationBar.h"
#import "Definition.h"

#define IOS7_SDK_AVAILABLE ([[[UIDevice currentDevice] systemVersion] intValue] >= 7)
@interface CRNavigationController ()

@end

@implementation CRNavigationController

- (id)init {
    if (IOS7_SDK_AVAILABLE) {
        self = [super initWithNavigationBarClass:[CRNavigationBar class] toolbarClass:nil];
    }
    else
    {
        self=[super init];
    }
    if(self) {
        // Custom initialization here, if needed.
    }
    return self;
}

- (id)initWithRootViewController:(UIViewController *)rootViewController {
    if (IOS7_SDK_AVAILABLE) {
        self = [super initWithNavigationBarClass:[CRNavigationBar class] toolbarClass:nil];
    }
    else
    {
        self=[super initWithRootViewController:rootViewController];
    }

    if(self) {
        self.viewControllers = @[rootViewController];
    }
    
    return self;
}

@end
