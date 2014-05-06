//
//  LIUNewBlogEntryViewController.m
//  Glue
//
//  Created by Eric Liu on 5/1/14.
//  Copyright (c) 2014 ITP 342. All rights reserved.
//

#import "LIUNewBlogEntryViewController.h"

@interface LIUNewBlogEntryViewController () <UITextFieldDelegate>{
    Firebase *f;
}

@property (weak, nonatomic) IBOutlet UIBarButtonItem *SaveAndDoneButton;


@end

@implementation LIUNewBlogEntryViewController

@synthesize blogEntryText = _blogEntryText;
@synthesize blogEntryTitle = _blogEntryTitle;
@synthesize blogMainImage = _blogMainImage;
@synthesize picker = _picker;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.SaveAndDoneButton.enabled = YES;
        
        Firebase *f = [[Firebase alloc] initWithUrl:@"https://glue.firebaseio.com/"];
                
    }
    return self;
}

- (IBAction)backButtonClicked:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(BOOL) textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    NSString *changedString = [textField.text stringByReplacingCharactersInRange:range withString:string];
    
    [self validateSaveButtonForText:changedString];
    
    return YES;
    
}

-(void) validateSaveButtonForText: (NSString *) text{
    self.SaveAndDoneButton.enabled = ([text length] > 0);
}

- (IBAction)doneButtonClicked:(id)sender {
    [self.blogEntryText resignFirstResponder];
    NSLog(@"\nSave button clicked!\n");
    
    __block NSString *newEntryTitle;
    __block NSString *newEntryText;
    UIImage *newEntryImage = [UIImage imageNamed:@"image_placeholder.png"];
    
    if (self.blogEntryText != nil) {
        newEntryTitle = self.blogEntryTitle.text;
    }
    else{
        newEntryTitle = @"New Entry Title";
    }
    
    if (self.blogEntryText != nil) {
        newEntryText = self.blogEntryText.text;
    }
    else{
        newEntryText = @"New Entry Text";
    }
    
    LIUBlogEntryModel *newEntry = [[LIUBlogEntryModel alloc] initWithEntry:newEntryTitle entry:newEntryText thumbImage:newEntryImage mainImage:newEntryImage];
    
//    if (self.completionHandler) {
//        self.completionHandler(newEntry);
//    }
    
    [self dismissViewControllerAnimated:YES completion:^(void){
//        LIUMasterViewController *masterViewController = [LIUMasterViewController sharedInstance];
//        [[masterViewController personalBlogEntries] insertObject:newEntry atIndex:0];
        
//        [[LIUMasterViewController sharedInstance]  newEntryEntered:newEntry];
        
        NSMutableArray *sharedPersonalBlogEntries =[[LIUBlogListModel sharedModel] personalBlogEntries];
        //[sharedPersonalBlogEntries insertObject:newEntry atIndex:0];
        
        
        //[sharedPersonalBlogEntries addObject:newEntry];
        
        //Write new blog entry to firebase
        Firebase *listref = [[Firebase alloc] initWithUrl:@"https://glue.firebaseio.com/PersonBlogFeed"];
        Firebase *newPushRef = [listref childByAutoId];
        [newPushRef setValue:@{@"Title":newEntryTitle,@"Text":newEntryText}];
                               
        
        //Delete after testing begin
        LIUBlogEntryModel *firebaseTestEntry = [[LIUBlogEntryModel alloc] initWithEntry:newEntryTitle entry:newEntryTitle thumbImage:[UIImage imageNamed:@"image_placeholder.png"] mainImage:[UIImage imageNamed:@"image_placeholder.png"]];
        
        //[sharedPersonalBlogEntries addObject:firebaseTestEntry];
        
        //Delete after testing end
        
        }];
    
    }


    

- (IBAction)backgroundTouched:(id)sender {
    [self.blogEntryText resignFirstResponder];
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



- (IBAction)addButtonTapped:(id)sender {
    if (self.picker == nil) {
        self.picker = [[UIImagePickerController alloc] init];
        self.picker.delegate = self;
        self.picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        self.picker.allowsEditing = NO;
    }
    
    [self presentViewController:_picker animated:YES completion:nil];
}
@end
