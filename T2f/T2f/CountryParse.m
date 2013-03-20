//
//  CountryParse.m
//  T2f
//
//  Created by mary on 13-3-19.
//  Copyright (c) 2013年 mary. All rights reserved.
//

#import "CountryParse.h"

@implementation CountryParse
@synthesize countryArray=_countryArray;

-(void)startPrase:(NSData*)data
{
	NSXMLParser *xmlPrase=[[NSXMLParser alloc] initWithData:data];
	xmlPrase.delegate=self;
	[xmlPrase parse];
	[xmlPrase autorelease];
}

#pragma mark -
#pragma mark NSXMLParserDelegate


- (void)parserDidStartDocument:(NSXMLParser *)parser
{
    NSLog(@"开始解析了");
    self.countryArray=[[NSMutableArray alloc] initWithCapacity:0];
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
     NSLog(@"解析已经发现了标签");
    if ([elementName isEqualToString:@"country"])
    {
        [self.countryArray addObject:attributeDict];
    }
    NSLog(@"字典数据shi %@",self.countryArray);
}
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{	
	NSLog(@"发现了标签里的内容");
}
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    NSLog(@"解析到了尾标签");

}
- (void)parserDidEndDocument:(NSXMLParser *)parser
{
	NSLog(@"解析结束");
}
-(void)dealloc
{
    [_countryArray release];
	[super dealloc];
}

@end
