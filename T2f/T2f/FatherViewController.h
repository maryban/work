//
//  FatherViewController.h
//  T2f
//
//  Created by mary on 13-3-18.
//  Copyright (c) 2013年 mary. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
@interface FatherViewController : UIViewController
{
    UIImageView *_moveImage;
    
    int          flag;
    
    BOOL         leftTouched;
    
    BOOL         rightTouched;
    
    NSTimer      *timer;
    
}
@property (assign,nonatomic) int index;
@end
