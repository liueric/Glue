//
//  LIUMasterViewController.h
//  Glue
//
//  Created by Eric Liu on 5/1/14.
//  Copyright (c) 2014 ITP 342. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LIUBlogEntryModel.h"
#import "LIUBlogListModel.h"

@interface LIUMasterViewController : UITableViewController

@property (strong) NSMutableArray *personalBlogEntries;

//+(instancetype)sharedInstance;
//+(void) newEntryEntered: (LIUBlogEntryModel *)newEntry;

@end
