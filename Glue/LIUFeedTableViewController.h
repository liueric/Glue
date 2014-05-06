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
#import "Firebase/Firebase.h"
#import "SWRevealViewController.h"


@interface LIUFeedTableViewController : UITableViewController
@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;

@property NSMutableArray *feedBlogEntries;

@end
