//
//  LIUFeedViewController.m
//  Glue
//
//  Created by Eric Liu on 5/4/14.
//  Copyright (c) 2014 ITP 342. All rights reserved.
//

#import "LIUFeedViewController.h"

@interface LIUFeedViewController ()

@end

@implementation LIUFeedViewController

@synthesize feedBlogEntries = _feedBlogEntries;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    LIUBlogEntryModel *entry1 = [[LIUBlogEntryModel alloc] initWithEntry:@"First Day!" entry:@"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum." thumbImage:[UIImage imageNamed:@"image_placeholder.png"] mainImage:[UIImage imageNamed:@"image_placeholder.png"]];
    
    LIUBlogEntryModel *entry2 = [[LIUBlogEntryModel alloc] initWithEntry:@"Second Day!" entry:@"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum." thumbImage:[UIImage imageNamed:@"image_placeholder.png"] mainImage:[UIImage imageNamed:@"image_placeholder.png"]];
    
    LIUBlogEntryModel *entry3 = [[LIUBlogEntryModel alloc] initWithEntry:@"Third Day!" entry:@"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum." thumbImage:[UIImage imageNamed:@"image_placeholder.png"] mainImage:[UIImage imageNamed:@"image_placeholder.png"]];
    
        
    
    _feedBlogEntries = [[NSMutableArray alloc] initWithObjects:entry1,entry2,entry3, nil];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    NSLog(@"\n\n%d\n\n",_feedBlogEntries.count);
    return _feedBlogEntries.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    static NSString *simpleTableIdentifier = @"SimpleTableCell";
//    
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
//    
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
//    }
//    
//    cell.textLabel.text = [_feedBlogEntries objectAtIndex:indexPath.row];
//    return cell;
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FeedBlogEntryCell"];
    
    LIUBlogEntryModel *EntryModel = [self.feedBlogEntries objectAtIndex:indexPath.row];
    
    cell.textLabel.text = EntryModel.blogTitle;
    cell.imageView.image = EntryModel.thumbImage;
    cell.detailTextLabel.text = EntryModel.blogEntry;
    

    return cell;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

// Implement the method didMoveToParentViewController
//-(void)didMoveToParentViewController:(UIViewController *)parent{
//    [self.tableView reloadData];
//}
//
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//    if ([[segue identifier] isEqualToString:@"showDetail"]) {
//        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
//        //NSDate *object = _objects[indexPath.row];
//        LIUBlogEntryModel *object = [self.feedBlogEntries objectAtIndex:self.tableView.indexPathForSelectedRow.row];
//        [[segue destinationViewController] setDetailItem:object];
//    }
//}

@end
