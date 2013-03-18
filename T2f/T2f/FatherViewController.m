//
//  FatherViewController.m
//  T2f
//
//  Created by mary on 13-3-18.
//  Copyright (c) 2013年 mary. All rights reserved.
//

#import "FatherViewController.h"
#import "SidebarViewController.h"

@interface FatherViewController ()

@end

@implementation FatherViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIImageView *imageView=[[UIImageView alloc] initWithFrame:CGRectMake(0, 460-50, 320, 50)];
    imageView.backgroundColor=[UIColor magentaColor];
//    imageView.image=[UIImage imageNamed:@"1.png"];
    [self.view addSubview:imageView];
    [imageView release];
    
    UIButton *leftBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [leftBtn setTitle:@"左边" forState:UIControlStateNormal];
    leftBtn.frame=CGRectMake(10, imageView.frame.origin.y+10, 40, 30);
    [leftBtn addTarget:self action:@selector(showLeftSideBar:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:leftBtn];
    
    UIButton *rightBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [rightBtn setTitle:@"右边" forState:UIControlStateNormal];
    rightBtn.frame=CGRectMake(270, imageView.frame.origin.y+10, 40, 30);
    [rightBtn addTarget:self action:@selector(showRightSideBar:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:rightBtn];
}

#pragma mark - ibaction

- (void)showLeftSideBar:(id)sender
{
    NSLog(@"左边按钮");
    if ([[SidebarViewController share] respondsToSelector:@selector(showSideBarControllerWithDirection:)]) {
        [[SidebarViewController share] showSideBarControllerWithDirection:SideBarShowDirectionLeft];
    }
}

- (void)showRightSideBar:(id)sender
{
     NSLog(@"右边按钮");
    if ([[SidebarViewController share] respondsToSelector:@selector(showSideBarControllerWithDirection:)]) {
        [[SidebarViewController share] showSideBarControllerWithDirection:SideBarShowDirectionRight];
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
