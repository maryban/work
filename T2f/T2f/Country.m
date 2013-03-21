//
//  Country.m
//  T2f
//
//  Created by mary on 13-3-21.
//  Copyright (c) 2013年 mary. All rights reserved.
//

#import "Country.h"

@implementation Country
@synthesize code=_code,name=_name,idd=_idd;
-(void)dealloc
{
    [super dealloc];
    [_code release];
//    [_name release];
//    [_idd release];
}
@end
