//
//  Entry.m
//  vot
//
//  Created by Foredoomed on 1/31/14.
//  Copyright (c) 2014 Foredoomed. All rights reserved.
//

#import "Entry.h"

@implementation Entry

- (id)initWithTitle:(NSString *)title
               link:(NSString *)link
      publishedDate:(NSString *)published
             author:(NSString *)author
            context:(NSString *)content {

  self = [super init];
  if (self) {
    self.title = title;
    self.link = link;
    self.published = published;
    self.author = author;
    self.content = content;
  }

  return self;
}

@end
