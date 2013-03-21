//
//  CountryViewController.m
//  T2f
//
//  Created by mary on 13-3-19.
//  Copyright (c) 2013年 mary. All rights reserved.
//

#import "CountryViewController.h"
#import "TBXML.h"
#import "Country.h"

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
    backBtn.frame=CGRectMake(10, 10, 46, 29);
    [backBtn setBackgroundImage:[UIImage imageNamed:@"返回-d.png"] forState:UIControlStateNormal];
    [backBtn setTitle:@"返回" forState:UIControlStateNormal];
    [backBtn setTitleColor:[UIColor colorWithWhite:1 alpha:0.8] forState:UIControlStateNormal];
    [backBtn setTitleColor:[UIColor colorWithWhite:0.5 alpha:0.8] forState:UIControlStateHighlighted];
    [backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backBtn];
    
    table=[[UITableView alloc] initWithFrame:CGRectMake(0, 44, 320, 416)];
    table.delegate=self;
    table.dataSource=self;
    table.separatorColor=[UIColor colorWithWhite:0.1 alpha:0.9];
    table.backgroundColor=[UIColor colorWithRed:0 green:0 blue:0 alpha:0.9];
    [self.view addSubview:table];
    
    _listArray=[[NSMutableArray alloc] initWithCapacity:0];

//从xml中读取数据
    NSString *Path =[[NSString alloc]initWithString:[[NSBundle mainBundle]pathForResource:@"countries_t2f"ofType:@"xml"]];
    NSData *data = [[NSData alloc]initWithContentsOfFile:Path];
//开始解析
    TBXML *tbXml=[TBXML newTBXMLWithXMLData:data error:Nil];
    TBXMLElement *root=tbXml.rootXMLElement;
    if (root)
    {
        TBXMLElement *element = tbXml.rootXMLElement;
        [self recurrence:element];
    }
    else
    {
        NSLog(@"Format Error!");
    }
}
//递归解析
- (void)recurrence:(TBXMLElement *)element {
    
    do {
        //迭代处理所有属性
        TBXMLAttribute * attribute = element->firstAttribute;
        while (attribute)
        {
            index++;
            Country *c;
            if (index%3==1)
            {
              c=[[Country alloc] init];
            }
            //显示
            if ([[TBXML attributeName:attribute] isEqualToString:@"code"])
            {
                c.code=[TBXML attributeValue:attribute];
            }
            else if ([[TBXML attributeName:attribute] isEqualToString:@"title"])
            {
                c.name=[TBXML attributeValue:attribute];
            }
            else if ([[TBXML attributeName:attribute] isEqualToString:@"idd"])
            {
                c.idd=[TBXML attributeValue:attribute];
            }
            //迭代
            attribute = attribute->next;
           //控制添加到数组的逻辑         
            if (index%3==0)
            {
                [self.listArray addObject:c];
                [c release];
            }
        }
        //递归处理子树
        if (element->firstChild)
        {
            [self recurrence:element->firstChild];
        }
        //迭代处理兄弟树
    } while ((element = element->nextSibling)); 
}

-(void)back
{
    [self dismissModalViewControllerAnimated:YES];
}
#pragma mark - UITableViewDatasource
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
    }
    cell.selectedBackgroundView=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"选中-t.png"]];
    [cell.selectedBackgroundView autorelease];
    Country *c=[self.listArray objectAtIndex:indexPath.row];
    cell.textLabel.text=[NSString  stringWithFormat:@"%@(+%@)",c.name,c.idd];
    cell.textLabel.textColor=[UIColor colorWithWhite:0.5 alpha:0.9];
    cell.textLabel.font=[UIFont systemFontOfSize:14];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Country *countryTable=[[self.listArray objectAtIndex:indexPath.row] retain];
    self.num=[NSString  stringWithFormat:@"%@(+%@)",countryTable.name,countryTable.idd];
    NSLog(@"you  select  num  is  %@",self.num);
    [self dismissModalViewControllerAnimated:YES];
}
//- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
//{
//    NSArray *array=[NSArray arrayWithObjects:@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"R",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z",nil];
//    return array;
//}
//- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
//{
//    if ([title isEqualToString:@"A"])
//    {
//        return  1;
//    }
//}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

@end
