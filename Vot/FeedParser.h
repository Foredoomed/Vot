//
//  FeedParser.h
//  vot
//
//  Created by Foredoomed on 1/31/14.
//  Copyright (c) 2014 Foredoomed. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Feed;

@interface FeedParser : NSObject

+ (Feed *)parse:(NSData *)rss;

@end
