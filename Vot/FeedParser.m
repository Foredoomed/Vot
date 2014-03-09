//
//  FeedParser.m
//  vot
//
//  Created by Foredoomed on 1/31/14.
//  Copyright (c) 2014 Foredoomed. All rights reserved.
//

#import "FeedParser.h"
#import "Feed.h"
#import "GDataXMLNode.h"
#import "Entry.h"

@implementation FeedParser

/**
 *  Parse feed xml into Fedd object
 *
 *  @param xml
 *
 *  @return Feed object
 */
+ (Feed *)parse:(NSData *)rss {

  NSData *xmlData = [[NSMutableData alloc] initWithData:rss];
  NSError *error;
  GDataXMLDocument *document =
      [[GDataXMLDocument alloc] initWithData:xmlData options:0 error:&error];

  if (document == Nil) {
    return nil;
  }

  Feed *feed = [[Feed alloc] init];

  NSArray *entries = [document.rootElement elementsForName:@"entry"];
  for (GDataXMLElement *element in entries) {
    NSString *title = nil;
    NSString *link = nil;
    NSString *published = nil;
    NSString *author = nil;
    NSString *content = nil;

    NSArray *titles = [element elementsForName:@"title"];
    if (titles.count > 0) {
      GDataXMLElement *xe = (GDataXMLElement *)[titles objectAtIndex:0];
      title = xe.stringValue;
    }

    NSArray *links = [element elementsForName:@"link"];
    if (links.count > 0) {
      GDataXMLElement *xe = (GDataXMLElement *)[links objectAtIndex:0];
      link = xe.stringValue;
    }

    NSArray *publishedDates = [element elementsForName:@"published"];
    if (publishedDates.count > 0) {
      GDataXMLElement *xe = (GDataXMLElement *)[publishedDates objectAtIndex:0];
      published = xe.stringValue;
    }

    NSArray *authors = [element elementsForName:@"author"];
    if (authors.count > 0) {
      GDataXMLElement *xe = (GDataXMLElement *)[authors objectAtIndex:0];
      NSArray *array = [xe elementsForName:@"name"];
      author = [[array objectAtIndex:0] stringValue];
    }

    NSArray *contents = [element elementsForName:@"content"];
    if (contents.count > 0) {
      GDataXMLElement *xe = (GDataXMLElement *)[contents objectAtIndex:0];
      content = xe.stringValue;
    }

    Entry *entry = [[Entry alloc] initWithTitle:title
                                           link:link
                                  publishedDate:published
                                         author:author
                                        context:content];

    [feed.entries addObject:entry];
  }

  [document release];

  return feed;
}

@end
