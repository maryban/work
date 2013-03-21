//
//  Country.h
//  T2f
//
//  Created by mary on 13-3-21.
//  Copyright (c) 2013年 mary. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Country : NSObject
{
    NSString    *_code;
    
    NSString    *_name;
    
    NSString    *_idd;
}
@property(retain,nonatomic)NSString    *code;
@property(retain,nonatomic)NSString    *name;
@property(retain,nonatomic)NSString    *idd;
@end
