//
//  Country.m
//  T2f
//
//  Created by mary on 13-3-19.
//  Copyright (c) 2013年 mary. All rights reserved.
//

#import "Country.h"

@implementation Country
@synthesize code=_code,idd=_idd,name=_name;

-(void)dealloc
{
    [super dealloc];
    [_code release];
    [_name release];
    [_idd release];
}
@end
