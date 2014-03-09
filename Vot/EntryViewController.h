//
//  EntryViewController.h
//  Vot
//
//  Created by Foredoomed on 3/8/14.
//  Copyright (c) 2014 Foredoomed. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Entry.h"

@interface EntryViewController : UIViewController
@property(nonatomic, strong) Entry *entry;
@property(weak, nonatomic) IBOutlet UITextView *contentTextView;

@end
