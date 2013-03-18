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
-(void)dealloc
{
    [super dealloc];
    [_moveImage release];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
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
    _moveImage.frame=CGRectMake(imageView.frame.size.width/2-55, imageView.frame.origin.y-2, 55, 50);
    _moveImage.layer.anchorPoint=CGPointMake(0, 0.5);
    [self.view addSubview:_moveImage];
    //    定时器调用做动画
   timer=[NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(onTimer) userInfo:nil repeats:YES];
    [self performSelector:@selector(cancelTimer) withObject:nil afterDelay:0.5];
    
}
//摇晃小图标
-(void)onTimer
{
    if (angle<=-30||angle>=30)
    {
        angle=-angle;
    }
    angle +=15;
    float rad=angle*(M_PI/180.0f);
    CGAffineTransform transform=CGAffineTransformMakeRotation(rad);
    [_moveImage setTransform:transform];
    NSLog(@"angle  %d",angle);
}
-(void)cancelTimer
{
    [timer invalidate];
    timer=nil;

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
