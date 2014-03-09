//
//  Feed.m
//  vot
//
//  Created by Foredoomed on 1/31/14.
//  Copyright (c) 2014 Foredoomed. All rights reserved.
//

#import "Feed.h"

@implementation Feed

- (id)init {

  self = [super init];
  if (self) {
    self.entries = [[NSMutableArray alloc] init];
  }
  return self;
}

@end
