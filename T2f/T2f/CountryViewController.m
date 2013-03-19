//
//  CountryViewController.m
//  T2f
//
//  Created by mary on 13-3-19.
//  Copyright (c) 2013年 mary. All rights reserved.
//

#import "CountryViewController.h"
#import "CountryParse.h"

@interface CountryViewController ()

@end

@implementation CountryViewController

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
    UIImageView *navImage=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    navImage.image=[UIImage imageNamed:@"选中-t.png"];
    [self.view addSubview:navImage];
    [navImage release];
    
    UILabel *title=[[UILabel alloc] initWithFrame:CGRectMake(120, 7, 100, 30)];
    title.backgroundColor=[UIColor clearColor];
    title.text=@"国家";
    title.textAlignment=NSTextAlignmentCenter;
    title.textColor=[UIColor whiteColor];
    title.font=[UIFont systemFontOfSize:20];
    [navImage addSubview:title];
    [title release];
    
    
    UIButton *backBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    backBtn.frame=CGRectMake(20, 10, 50, 30);
    [backBtn setTitle:@"返回" forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backBtn];
    
    UITableView *table=[[UITableView alloc] initWithFrame:CGRectMake(0, 44, 320, 416)];
    table.delegate=self;
    table.dataSource=self;
    [self.view addSubview:table];
    [table release];
//    从xml中读取数据
    
    NSString *numberPath =[[NSString alloc]initWithString:[[NSBundle mainBundle]pathForResource:@"countries_t2f"ofType:@"xml"]];
    NSData *numberData = [[NSData alloc]initWithContentsOfFile:numberPath];
    NSString *namePath =[[NSString alloc]initWithString:[[NSBundle mainBundle]pathForResource:@"strings-CN"ofType:@"xml"]];
    NSData *nameData = [[NSData alloc]initWithContentsOfFile:namePath];
//开始解析    
    CountryParse *parse=[[CountryParse alloc] init];
    [parse startPrase:numberData];
    [parse startPrase:nameData];
    [parse release];
}

-(void)back
{
    [self dismissModalViewControllerAnimated:YES];
}

#pragma mark - TableViewDatasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

@end
