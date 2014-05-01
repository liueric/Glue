//
//  LIUDetailViewController.m
//  Glue
//
//  Created by Eric Liu on 5/1/14.
//  Copyright (c) 2014 ITP 342. All rights reserved.
//

#import "LIUDetailViewController.h"

@interface LIUDetailViewController ()
- (void)configureView;
@end

@implementation LIUDetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.detailItem) {
        self.detailDescriptionLabel.text = [self.detailItem description];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
