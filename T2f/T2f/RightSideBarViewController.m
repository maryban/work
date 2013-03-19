//
//  RightSideBarViewController.m
//  T2f
//
//  Created by mary on 13-3-18.
//  Copyright (c) 2013年 mary. All rights reserved.
//

#import "RightSideBarViewController.h"

@interface RightSideBarViewController ()
{
    NSArray *_dataList;
    NSArray *_imgList;

}
@end

@implementation RightSideBarViewController

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
//   初始化控件
    UILabel *label=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 100)];
    label.text=@"个人中心";
    label.backgroundColor=[UIColor colorWithRed:0 green:0 blue:0 alpha:0.9];
    label.textColor=[UIColor whiteColor];
    label.font=[UIFont systemFontOfSize:26];
    label.textAlignment=NSTextAlignmentCenter;
    [self.view addSubview:label];
    [label release];
    UIImageView  *bgImage=[[UIImageView alloc] initWithFrame:CGRectMake(0, 100, 320, 296)];
    bgImage.image=[UIImage imageNamed:@"user_背景.png"];
    [self.view addSubview:bgImage];
    [bgImage release];
    
    UIView *vi=[[UIView alloc] initWithFrame:CGRectMake(0, 396, 320, 84)];
    vi.backgroundColor=[UIColor colorWithRed:0 green:0 blue:0 alpha:1];
    [self.view addSubview:vi];
    [vi release];

    UIScrollView *scroller=[[UIScrollView alloc] initWithFrame:CGRectMake(0, 100, 320, 346)];
    scroller.backgroundColor=[UIColor clearColor];
    scroller.contentSize=CGSizeMake(320, 350);
    scroller.showsVerticalScrollIndicator=NO;
    [self.view addSubview:scroller];
    [scroller release];
    UITableView *table=[[UITableView alloc] initWithFrame:CGRectMake(50, 170, 270, 176)];
    table.separatorColor=[UIColor colorWithWhite:0.2 alpha:0.9];
    table.delegate=self;
    table.dataSource=self;
    table.backgroundColor=[UIColor colorWithRed:0 green:0 blue:0 alpha:0.9];
    [scroller addSubview:table];
    [table release];
    UIImageView  *qiqiuImage=[[UIImageView alloc] initWithFrame:CGRectMake(50, table.frame.origin.y-150, 94, 170)];
    qiqiuImage.image=[UIImage imageNamed:@"user_气球.png"];
    [scroller addSubview:qiqiuImage];
    [qiqiuImage release];
//  表中数据
    _dataList=[[NSArray alloc] initWithObjects:@"用户ID：123212122",@"点数：100点",@"消息中心", nil];
    _imgList=[[NSArray alloc] initWithObjects:@"用户ID.png",@"点数-t.png",@"消息中心.png", nil];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_dataList count]+1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    if (indexPath.row==0)
    {
//        cell.textLabel.text=@"未登录";
    }else
    {
    cell.imageView.image=[UIImage imageNamed:[_imgList objectAtIndex:indexPath.row-1]];
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = [_dataList objectAtIndex:indexPath.row-1];
    }
    cell.textLabel.textColor=[UIColor whiteColor];
    cell.textLabel.font=[UIFont systemFontOfSize:14];
   
    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
