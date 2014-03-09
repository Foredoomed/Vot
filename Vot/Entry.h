//
//  Entry.h
//  vot
//
//  Created by Foredoomed on 1/31/14.
//  Copyright (c) 2014 Foredoomed. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Entry : NSObject

@property(nonatomic, copy) NSString *title;
@property(nonatomic, copy) NSString *link;
@property(nonatomic, copy) NSString *published;
@property(nonatomic, copy) NSString *author;
@property(nonatomic, copy) NSString *content;

- (id)initWithTitle:(NSString *)title
               link:(NSString *)link
      publishedDate:(NSString *)published
             author:(NSString *)author
            context:(NSString *)content;

@end
