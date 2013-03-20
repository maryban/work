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
-(void)dealloc
{
    [super dealloc];
    [bgImage release];
    [scroller release];
    [table release];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
//背景初始化
    bgImage=[[UIImageView alloc] initWithFrame:CGRectMake(0, 50, 320, 296)];
    bgImage.image=[UIImage imageNamed:@"user_背景.png"];
    [self.view addSubview:bgImage];
    
    UILabel *label=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 100)];
    label.text=@"个人中心";
    label.backgroundColor=[UIColor colorWithRed:0 green:0 blue:0 alpha:1];
    label.textColor=[UIColor whiteColor];
    label.font=[UIFont systemFontOfSize:26];
    label.textAlignment=NSTextAlignmentCenter;
    [self.view addSubview:label];
    [label release];
 
//scrollView初始化    
    scroller=[[UIScrollView alloc] initWithFrame:CGRectMake(0, 100, 320, 400)];
    scroller.backgroundColor=[UIColor clearColor];
    scroller.contentSize=CGSizeMake(320, 410);
    scroller.showsVerticalScrollIndicator=NO;
    scroller.delegate=self;
    [self.view addSubview:scroller];
    
//表的初始化
    UIView *vi1=[[UIView alloc] initWithFrame:CGRectMake(50, 170, 270, 400)];
    vi1.backgroundColor=[UIColor whiteColor];
    [scroller addSubview:vi1];
    UIView *vi2=[[UIView alloc] initWithFrame:CGRectMake(50, 170, 270, 400)];
    vi2.backgroundColor=[UIColor colorWithRed:0 green:0 blue:0 alpha:0.9];
    [scroller addSubview:vi2];
    [vi1 release];
    [vi2 release];
    
    table=[[UITableView alloc] initWithFrame:CGRectMake(50, 170, 270, 176)];
    table.separatorColor=[UIColor colorWithWhite:0.2 alpha:0.9];
    table.delegate=self;
    table.dataSource=self;
    table.backgroundColor=[UIColor groupTableViewBackgroundColor];
    [scroller addSubview:table];
    
    UIImageView  *qiqiuImage=[[UIImageView alloc] initWithFrame:CGRectMake(50, table.frame.origin.y-150, 94, 170)];
    qiqiuImage.image=[UIImage imageNamed:@"user_气球.png"];
    [scroller addSubview:qiqiuImage];
    [qiqiuImage release];
//  表中数据
    _dataList=[[NSArray alloc] initWithObjects:@"用户ID：123212122",@"点数：100点",@"消息中心", nil];
    _imgList=[[NSArray alloc] initWithObjects:@"用户ID.png",@"点数-t.png",@"消息中心.png", nil];
}

#pragma mark UIScrollerViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{

    if (scrollView.contentOffset.y<0&&scrollView.contentOffset.y>-50){
        [UIView beginAnimations:nil context:nil];
        bgImage.frame=CGRectMake(0, 50-scrollView.contentOffset.y, 320, 296);
        [UIView setAnimationDuration:1];
        [UIView commitAnimations];
    }
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

    }
    cell.selectedBackgroundView=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"选中-t.png"]];
    [cell.selectedBackgroundView autorelease];
    if (indexPath.row==0)
    {
//        cell.textLabel.text=@"未登录";
    }else
    {
        UIImageView *img=[[UIImageView alloc] initWithFrame:CGRectMake(220, 7, 30, 30)];
//        img.tag=102;
        [cell.contentView addSubview:img];
        [img release];
//        UIImageView *img=(UIImageView *)[cell.contentView viewWithTag:102];
        img.image=[UIImage imageNamed:@"箭头.png"];
        cell.imageView.image=[UIImage imageNamed:[_imgList objectAtIndex:indexPath.row-1]];
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
