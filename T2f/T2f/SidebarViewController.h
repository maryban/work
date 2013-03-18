//
//  SidebarViewController.h
//  T2f
//
//  Created by mary on 13-3-18.
//  Copyright (c) 2013年 mary. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SideBarSelectedDelegate.h"

@interface SidebarViewController : UIViewController<SideBarSelectDelegate,UINavigationControllerDelegate>

@property (retain,nonatomic) UIView *contentView;
@property (retain,nonatomic) UIView *navBackView;

+ (id)share;

@end
