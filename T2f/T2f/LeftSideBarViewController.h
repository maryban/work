//
//  LeftSideBarViewController.h
//  T2f
//
//  Created by mary on 13-3-18.
//  Copyright (c) 2013年 mary. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SideBarSelectDelegate ;

@interface LeftSideBarViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    UIImageView *cellbgImage;
}
@property (retain,nonatomic) UITableView *mainTableView;
@property (assign,nonatomic)id<SideBarSelectDelegate>delegate;
@end