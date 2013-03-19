//
//  LeftSideBarViewController.m
//  T2f
//
//  Created by mary on 13-3-18.
//  Copyright (c) 2013年 mary. All rights reserved.
//

#import "LeftSideBarViewController.h"
#import "FatherViewController.h"
#import "SideBarSelectedDelegate.h"
@interface LeftSideBarViewController ()
{
    NSArray *_dataList;
    NSArray *_imgList;
    int _selectIdnex;
}
@end

@implementation LeftSideBarViewController

@synthesize mainTableView,delegate;

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
    [mainTableView release];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    UIImageView *imageView=[[UIImageView alloc] initWithFrame:CGRectMake(110, 100, 100, 100)];
    imageView.image=[UIImage imageNamed:@"LOGO.png"];
    [self.view addSubview:imageView];
    [imageView release];
    UIScrollView *scrollView=[[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    scrollView.contentSize=CGSizeMake(320, 490);
    scrollView.backgroundColor=[UIColor colorWithRed:0 green:0 blue:0 alpha:0.9];
    [self.view addSubview:scrollView];
    [scrollView release];
    
    mainTableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 260, 270, 176)];
    mainTableView.backgroundColor=[UIColor clearColor];
    mainTableView.separatorColor=[UIColor colorWithWhite:0.2 alpha:0.9];
    mainTableView.delegate=self;
    mainTableView.dataSource=self;
    [scrollView addSubview:mainTableView];
    _dataList=[[NSArray alloc] initWithObjects:@"拨号",@"获取点数",@"推荐好友",@"设置", nil];
    _imgList=[[NSArray alloc] initWithObjects:@"拨号-n.png",@"获取点数-n.png",@"推荐好友-n.png",@"设置-n.png", nil];
    if ([delegate respondsToSelector:@selector(leftSideBarSelectWithController:)]) {
        [delegate leftSideBarSelectWithController:[self subConWithIndex:0]];
        _selectIdnex = 0;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_dataList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cellbgImage=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 270, 44)];
        [cell addSubview:cellbgImage];
        cellbgImage.alpha=0;
        [cellbgImage release];
    }
    cellbgImage.image=[UIImage imageNamed:@"选中-t.png"];
    cell.imageView.image=[UIImage imageNamed:[_imgList objectAtIndex:indexPath.row]];
    cell.textLabel.textColor=[UIColor whiteColor];
    cell.textLabel.font=[UIFont systemFontOfSize:14];
    cell.textLabel.text = [_dataList objectAtIndex:indexPath.row];
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.1];
        cellbgImage.alpha=1;
        [UIView commitAnimations];
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.2];
        cellbgImage.alpha=0;
        [UIView commitAnimations];

    if ([delegate respondsToSelector:@selector(leftSideBarSelectWithController:)]) {
        if (indexPath.row == _selectIdnex) {
            [delegate leftSideBarSelectWithController:nil];
        }else
        {
            [delegate leftSideBarSelectWithController:[self subConWithIndex:indexPath.row]];
        }
    }
    _selectIdnex = indexPath.row;
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (UINavigationController *)subConWithIndex:(int)index
{
    FatherViewController *fatherVC = [[FatherViewController alloc] init];
    fatherVC.index = index+1;
    UINavigationController *nav= [[UINavigationController alloc] initWithRootViewController:fatherVC];
    nav.navigationBar.hidden = YES;
    [fatherVC release];
    return nav ;
}

@end
