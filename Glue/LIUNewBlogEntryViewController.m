//
//  LIUNewBlogEntryViewController.m
//  Glue
//
//  Created by Eric Liu on 5/1/14.
//  Copyright (c) 2014 ITP 342. All rights reserved.
//

#import "LIUNewBlogEntryViewController.h"

@interface LIUNewBlogEntryViewController ()

@property (weak, nonatomic) IBOutlet UITextView *NewBlogEntryText;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *SaveAndDoneButton;

@end

@implementation LIUNewBlogEntryViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (IBAction)backButtonClicked:(id)sender {
}

- (IBAction)doneButtonClicked:(id)sender {
    [self.NewBlogEntryText resignFirstResponder];
    self.SaveAndDoneButton.title = @"Save";
}

- (IBAction)backgroundTouched:(id)sender {
    [self.NewBlogEntryText resignFirstResponder];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

@end
