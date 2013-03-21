//
//  CountryViewController.h
//  T2f
//
//  Created by mary on 13-3-19.
//  Copyright (c) 2013年 mary. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CountryViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray      *_listArray;
    
    UITableView         *table;
   
    NSString            *_num;
    
    int                 index;
}
@property(nonatomic,retain)NSMutableArray      *listArray;
@property(nonatomic,retain)NSString            *num;
@end
