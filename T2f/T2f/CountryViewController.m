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
@synthesize listArray=_listArray,num=_num;

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
    [_listArray release];
    [table release];
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
    backBtn.frame=CGRectMake(20, 10, 46, 29);
    [backBtn setBackgroundImage:[UIImage imageNamed:@"返回-d.png"] forState:UIControlStateNormal];
    [backBtn setTitle:@"返回" forState:UIControlStateNormal];
    [backBtn setTitleColor:[UIColor colorWithWhite:0.1 alpha:0.9] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backBtn];
    
    table=[[UITableView alloc] initWithFrame:CGRectMake(0, 44, 320, 416)];
    table.delegate=self;
    table.dataSource=self;
    table.separatorColor=[UIColor colorWithWhite:0.1 alpha:0.85];
    table.backgroundColor=[UIColor colorWithRed:0 green:0 blue:0 alpha:0.9];
    [self.view addSubview:table];
//    从xml中读取数据
    
    NSString *Path =[[NSString alloc]initWithString:[[NSBundle mainBundle]pathForResource:@"countries_t2f"ofType:@"xml"]];
    NSData *data = [[NSData alloc]initWithContentsOfFile:Path];

    
//开始解析
    [NSThread detachNewThreadSelector:@selector(beginParse:) toTarget:self withObject:data];

}
-(void)beginParse:(NSData *)data
{
    CountryParse *parse=[[CountryParse alloc] init];
    [parse startPrase:data];
    [parse release];
    [self performSelectorOnMainThread:@selector(showData:) withObject:parse.countryArray waitUntilDone:NO];
}

-(void)showData:(NSArray *)array
{
    self.listArray=array;
    [table reloadData];
}
-(void)back
{
    [self dismissModalViewControllerAnimated:YES];
}

#pragma mark - TableViewDatasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  [self.listArray count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    NSDictionary *dic=[self.listArray objectAtIndex:indexPath.row];
    cell.textLabel.text=[NSString  stringWithFormat:@"%@(+%@)",[dic objectForKey:@"title"],[dic objectForKey:@"idd"]];
    cell.textLabel.textColor=[UIColor colorWithWhite:0.5 alpha:0.9];
    cell.textLabel.font=[UIFont systemFontOfSize:14];
    return cell;
}
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *dic=[self.listArray objectAtIndex:indexPath.row];
    self.num=[NSString  stringWithFormat:@"%@(+%@)",[dic objectForKey:@"title"],[dic objectForKey:@"idd"]];
    NSLog(@"you  select  num  is  %@",self.num);
    [self dismissModalViewControllerAnimated:YES];
}
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    NSArray *array=[NSArray arrayWithObjects:@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"R",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z",nil];
    return array;
}
- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    return 4;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

@end
