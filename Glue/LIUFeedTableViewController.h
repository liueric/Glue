//
//  LIUFeedTableViewController.h
//  Glue
//
//  Created by Eric Liu on 5/4/14.
//  Copyright (c) 2014 ITP 342. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LIUBlogEntryModel.h"
#import "LIUBlogListModel.h"

@interface LIUFeedTableViewController : UITableViewController

@property NSMutableArray *feedBlogEntries;

@end