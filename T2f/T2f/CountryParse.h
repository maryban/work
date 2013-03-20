//
//  CountryParse.h
//  T2f
//
//  Created by mary on 13-3-19.
//  Copyright (c) 2013年 mary. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CountryParse : NSObject<NSXMLParserDelegate>
{    
    
    NSMutableArray       *_countryArray;
    
}
@property(nonatomic,retain)NSMutableArray          *countryArray;

-(void)startPrase:(NSData*)data;

@end
