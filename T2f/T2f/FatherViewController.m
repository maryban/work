//
//  FatherViewController.m
//  T2f
//
//  Created by mary on 13-3-18.
//  Copyright (c) 2013年 mary. All rights reserved.
//

#import "FatherViewController.h"
#import "SidebarViewController.h"
#import "CountryViewController.h"

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
-(void)dealloc
{
    [super dealloc];
    [_moveImage release];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    UIButton *countryBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    countryBtn.frame=CGRectMake(120, 220, 80, 50);
    [countryBtn setTitle:@"选择国家" forState:UIControlStateNormal];
    [countryBtn addTarget:self action:@selector(addCountry) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:countryBtn];
    
    
//  初始化控件
    UIImageView *imageView=[[UIImageView alloc] initWithFrame:CGRectMake(0, 460-50, 320, 50)];
    imageView.image=[UIImage imageNamed:@"menu.png"];    
    [self.view addSubview:imageView];
    [imageView release];

    UIButton *leftBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"菜单-n.png"] forState:UIControlStateNormal];
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"菜单-d.png"] forState:UIControlStateHighlighted];
    leftBtn.frame=CGRectMake(10, imageView.frame.origin.y+10, 40, 30);
    [leftBtn addTarget:self action:@selector(showLeftSideBar:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:leftBtn];
    
    UIButton *rightBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [rightBtn setBackgroundImage:[UIImage imageNamed:@"个人中心-n.png"] forState:UIControlStateNormal];
    [rightBtn setBackgroundImage:[UIImage imageNamed:@"个人中心-d.png"] forState:UIControlStateHighlighted];
    rightBtn.frame=CGRectMake(270, imageView.frame.origin.y+10, 40, 30);
    [rightBtn addTarget:self action:@selector(showRightSideBar:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:rightBtn];

    _moveImage=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"拨号_icon-n.png"]];
    _moveImage.frame=CGRectMake(132.5, 25, 55, 50);
    _moveImage.layer.anchorPoint=CGPointMake(0.5, 1);
    [imageView addSubview:_moveImage];
    UIButton *menuBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    menuBtn.frame=CGRectMake(132.5, 410, 55, 50);
    [menuBtn addTarget:self action:@selector(beginTimer) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:menuBtn];
    [self beginTimer];
    
}
//选择国家
-(void)addCountry
{
    CountryViewController *country=[[CountryViewController alloc] init];
    [self presentModalViewController:country animated:YES];
    [country release];
}

//启动定时器  
-(void)beginTimer
{
    timer=[NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(onTimer) userInfo:nil repeats:YES];
    [self performSelector:@selector(cancelTimer) withObject:nil afterDelay:1.2];
}
//摇晃小图标
-(void)onTimer
{      
    static int  flag =0;
    if (angle<=0&&angle>-30&&flag%12>=0&&flag%12<3)
    {
        angle=angle-10;
    }
    if (angle>=-30&&angle<30&&flag%12>=3&&flag%12<9)
    {
        angle=angle+10;
    }
    if (angle>0&&angle<=30&&flag%12>=9&&flag%12<12)
    {
        angle=angle-10;
    }
    flag++;
    NSLog(@"angle    shi %d",angle);
    float rad=angle*(M_PI/180.0f);
    CGAffineTransform transform=CGAffineTransformMakeRotation(rad);
    [_moveImage setTransform:transform];
}
//停掉timer
-(void)cancelTimer
{
    [timer invalidate];
    timer=nil;

}
#pragma mark - btnFoundation

- (void)showLeftSideBar:(id)sender
{
    NSLog(@"左边按钮");
    if (leftTouched==NO)
    {
      if ([[SidebarViewController share] respondsToSelector:@selector(showSideBarControllerWithDirection:)])
      {
        [[SidebarViewController share] showSideBarControllerWithDirection:SideBarShowDirectionLeft];
      }
    }
   if (leftTouched==YES)
   {
        if ([[SidebarViewController share] respondsToSelector:@selector(showSideBarControllerWithDirection:)])
        {
            [[SidebarViewController share] showSideBarControllerWithDirection:SideBarShowDirectionNone];
        }
   }
    leftTouched=!leftTouched;
}

- (void)showRightSideBar:(id)sender
{
     NSLog(@"右边按钮");
    if (rightTouched==NO)
    {
        if ([[SidebarViewController share] respondsToSelector:@selector(showSideBarControllerWithDirection:)])
        {
            [[SidebarViewController share] showSideBarControllerWithDirection:SideBarShowDirectionRight];
        }
    }
    if (rightTouched==YES)
    {
        if ([[SidebarViewController share] respondsToSelector:@selector(showSideBarControllerWithDirection:)])
        {
            [[SidebarViewController share] showSideBarControllerWithDirection:SideBarShowDirectionNone];
        }
    }
    rightTouched=!rightTouched;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
