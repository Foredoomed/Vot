//
//  FeedTableViewController.m
//  Vot
//
//  Created by Foredoomed on 3/1/14.
//  Copyright (c) 2014 Foredoomed. All rights reserved.
//

#import "FeedTableViewController.h"
#import "AFNetworking.h"
#import "Feed.h"
#import "FeedParser.h"
#import "Entry.h"
#import "EntryViewController.h"

@interface FeedTableViewController ()

@end

static NSString *const URL = @"http://v2ex.com/index.xml";

@implementation FeedTableViewController

- (IBAction)fetchFeed {
  [self.refreshControl beginRefreshing];
  AFHTTPRequestOperationManager *manager =
      [AFHTTPRequestOperationManager manager];

  AFHTTPResponseSerializer *responseSerializer =
      [AFHTTPResponseSerializer serializer];

  responseSerializer.acceptableContentTypes =
      [NSSet setWithObjects:@"application/atom+xml", nil];
  manager.responseSerializer = responseSerializer;

    [manager GET:URL parameters:nil
         success:^(AFHTTPRequestOperation *operation, id responseObject){
      NSData *response = (NSData *)responseObject;
      Feed *feed = [FeedParser parse:response];
      self.feed = feed;

      [self.tableView reloadData];
      [self.refreshControl endRefreshing];
    }
failure:
  ^(AFHTTPRequestOperation * operation, NSError * error) {
    NSLog(@"error: , %@", error);
  }];
}

- (id)initWithStyle:(UITableViewStyle)style {
  self = [super initWithStyle:style];
  if (self) {
    // Custom initialization
  }
  return self;
}

- (void)viewDidLoad {
  [super viewDidLoad];

  // Uncomment the following line to preserve selection between presentations.
  // self.clearsSelectionOnViewWillAppear = NO;

  // Uncomment the following line to display an Edit button in the navigation
  // bar for this view controller.
  // self.navigationItem.rightBarButtonItem = self.editButtonItem;

  [self.tableView setSeparatorInset:UIEdgeInsetsZero];
  [self fetchFeed];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

  // Return the number of sections.
  return 1;
}

- (NSInteger)tableView:(UITableView *)tableView
    numberOfRowsInSection:(NSInteger)section {

  // Return the number of rows in the section.
  return self.feed.entries.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  static NSString *CellIdentifier = @"TableCell";
  UITableViewCell *cell =
      [tableView dequeueReusableCellWithIdentifier:CellIdentifier
                                      forIndexPath:indexPath];

  // Configure the cell...

  int row = indexPath.row;
  Entry *entry = self.feed.entries[row];
  cell.textLabel.text = entry.title;
  cell.detailTextLabel.text =
      [[entry.published stringByReplacingOccurrencesOfString:@"T"
                                                  withString:@" "]
          stringByReplacingOccurrencesOfString:@"Z"
                                    withString:@""];
  cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
  cell.textLabel.numberOfLines = 0;
  cell.accessoryType = UITableViewCellAccessoryNone;
  return cell;
}

#pragma mark - Navigation

// In a story board-based application, you will often want to do a little
// preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  // Get the new view controller using [segue destinationViewController].
  // Pass the selected object to the new view controller.

  if ([segue.destinationViewController
          isKindOfClass:[UIViewController class]]) {

    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    Entry *entry = (Entry *)self.feed.entries[indexPath.row];
    [segue.destinationViewController setEntry:entry];
  }
}

@end
