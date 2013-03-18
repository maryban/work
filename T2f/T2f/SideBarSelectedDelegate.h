//
//  SideBarSelectedDelegate.h
//  T2f
//
//  Created by mary on 13-3-18.
//  Copyright (c) 2013年 mary. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum _SideBarShowDirection
{
    SideBarShowDirectionNone = 0,
    SideBarShowDirectionLeft = 1,
    SideBarShowDirectionRight = 2
}SideBarShowDirection;

@protocol SideBarSelectDelegate <NSObject>

- (void)leftSideBarSelectWithController:(UIViewController *)controller;
- (void)rightSideBarSelectWithController:(UIViewController *)controller;
- (void)showSideBarControllerWithDirection:(SideBarShowDirection)direction;

@end