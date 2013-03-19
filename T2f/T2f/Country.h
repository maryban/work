//
//  Country.h
//  T2f
//
//  Created by mary on 13-3-19.
//  Copyright (c) 2013年 mary. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Country : NSObject
{
    NSString *_code;
    NSString *_idd;
    NSString *_name;
}
@property(nonatomic,retain)NSString *code;
@property(nonatomic,retain)NSString *idd;
@property(nonatomic,retain)NSString *name;
@end
