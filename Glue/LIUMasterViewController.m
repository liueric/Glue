//
//  LIUMasterViewController.m
//  Glue
//
//  Created by Eric Liu on 5/1/14.
//  Copyright (c) 2014 ITP 342. All rights reserved.
//

#import "LIUMasterViewController.h"

#import "LIUDetailViewController.h"

@interface LIUMasterViewController () {
    NSMutableArray *_objects;
}
@end

@implementation LIUMasterViewController

@synthesize personalBlogEntries = _personalBlogEntries;

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    _personalBlogEntries = [[LIUBlogListModel sharedModel] personalBlogEntries];
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    //self.navigationItem.leftBarButtonItem = self.editButtonItem;

    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addButtonTapped:)];
//    self.navigationItem.rightBarButtonItem = addButton;
    self.title = @"Yours";
    
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc]
                                        init];
    refreshControl.tintColor = [UIColor grayColor];
    [refreshControl addTarget:self action:@selector(updateTable) forControlEvents:UIControlEventValueChanged];
    self.refreshControl = refreshControl;

    // Change button color
    //_sidebarButton.tintColor = [UIColor colorWithWhite:0.96f alpha:0.2f];
    
    // Set the side bar button action. When it's tapped, it'll show up the sidebar.
    _sidebarButton.target = self.revealViewController;
    _sidebarButton.action = @selector(revealToggle:);
    
    // Set the gesture
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
}

-(void)updateTable{
    [self.tableView reloadData];
    
    [self.refreshControl endRefreshing];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender
{
    if (!_objects) {
        _objects = [[NSMutableArray alloc] init];
    }
    [_objects insertObject:[NSDate date] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

//- (void)addButtonTapped:(id)sender {
//    UIImage *imagePlaceholder = [UIImage imageNamed:@"image_placeholder.png"];
//    LIUBlogEntryModel *newEntry = [[LIUBlogEntryModel alloc] initWithEntry:@"Enter Title" entry:@"What's new today?" thumbImage:imagePlaceholder mainImage:imagePlaceholder];
//    [_personalBlogEntries addObject:newEntry];
//    
//    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:_personalBlogEntries.count-1 inSection:0];
//    NSArray *indexPaths = [NSArray arrayWithObject:indexPath];
//    [self.tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:YES];
//    
//    [self.tableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionMiddle];
//    [self performSegueWithIdentifier:@"showDetail" sender:self];
//}

//+(void) newEntryEntered: (LIUBlogEntryModel *)newEntry{
//    [_personalBlogEntries addObject:newEntry];
//    
//    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:_personalBlogEntries.count-1 inSection:0];
//    NSArray *indexPaths = [NSArray arrayWithObject:indexPath];
//    [self.tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:YES];
//    
//    NSLog(@"\n\nCompletion Handler Called\n\n");
//    NSLog(@"\n\nEntry Count: %lu",(unsigned long)_personalBlogEntries.count);
//    
//    for (LIUBlogEntryModel *entry in _personalBlogEntries){
//        NSLog(@"\n%@\n",entry.blogTitle);
//    }
//    //[self.tableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionMiddle];
//    //[self performSegueWithIdentifier:@"showDetail" sender:self];
//}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //return _objects.count;
    return _personalBlogEntries.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BlogEntryCell" forIndexPath:indexPath];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BlogEntryCell"];

    LIUBlogEntryModel *EntryModel = [self.personalBlogEntries objectAtIndex:indexPath.row];
    
    cell.textLabel.text = EntryModel.blogTitle;
    cell.imageView.image = EntryModel.thumbImage;
    cell.detailTextLabel.text = EntryModel.blogEntry;
    
    //NSDate *object = _objects[indexPath.row];
    //cell.textLabel.text = [object description];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        //[_objects removeObjectAtIndex:indexPath.row];
        [_personalBlogEntries removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

//+(instancetype) sharedInstance{
//    static LIUMasterViewController *_sharedInstance = nil;
//    
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        _sharedInstance = [[self alloc] init];
//    });
//    
//    return _sharedInstance;
//}

// Implement the method didMoveToParentViewController
-(void)didMoveToParentViewController:(UIViewController *)parent{
    [self.tableView reloadData];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        //NSDate *object = _objects[indexPath.row];
        LIUBlogEntryModel *object = [self.personalBlogEntries objectAtIndex:self.tableView.indexPathForSelectedRow.row];
        [[segue destinationViewController] setDetailItem:object];
    }
}

@end
