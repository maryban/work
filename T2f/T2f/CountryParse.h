//
//  CountryParse.h
//  T2f
//
//  Created by mary on 13-3-19.
//  Copyright (c) 2013年 mary. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Country.h"

@interface CountryParse : NSObject<NSXMLParserDelegate>
{
    NSMutableString    *_result;
    
    NSMutableString    *_contentString;
    
    Country            *_country;
   
    NSMutableArray     *_countryArray;
}
@property(nonatomic,retain)Country            *country;
@property(nonatomic,retain)NSMutableArray     *countryArray;

-(void)startPrase:(NSData*)data;

@end
