//
//  EntryViewController.m
//  Vot
//
//  Created by Foredoomed on 3/8/14.
//  Copyright (c) 2014 Foredoomed. All rights reserved.
//

#import "EntryViewController.h"

@interface EntryViewController ()

@end

@implementation EntryViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view.

  self.contentTextView.text =
      [self.entry.content stringByReplacingOccurrencesOfString:@"<br />"
                                                    withString:@"\n"];
}

@end
