//
//  CountryParse.m
//  T2f
//
//  Created by mary on 13-3-19.
//  Copyright (c) 2013年 mary. All rights reserved.
//

#import "CountryParse.h"

@implementation CountryParse
@synthesize country=_country,countryArray=_countryArray;
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
	_contentString=[[NSMutableString alloc] initWithCapacity:0];
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
	//清空可辨字符串
	[_contentString setString:@""];
}
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
	
	[_contentString appendString:string];
	
}
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
	if ([elementName isEqualToString:@"code"])
	{
		self.country.code=_contentString;
	}
    else if ([elementName isEqualToString:@"name"])
	{
		self.country.name=_contentString;
	}
    else if ([elementName isEqualToString:@"idd"])
	{
		self.country.idd=_contentString;
	}
    [self.countryArray addObject:self.country];
}
- (void)parserDidEndDocument:(NSXMLParser *)parser
{
	
}
-(void)dealloc
{
	[_contentString release];
	[super dealloc];
}

@end
