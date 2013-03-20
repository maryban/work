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
    NSArray      *_listArray;
    UITableView  *table;
    NSString     *_num;
}
@property(nonatomic,retain)NSArray      *listArray;
@property(nonatomic,retain)NSString     *num;
@end
