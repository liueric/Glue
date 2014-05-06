//
//  LIUNewBlogEntryViewController.h
//  Glue
//
//  Created by Eric Liu on 5/1/14.
//  Copyright (c) 2014 ITP 342. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Firebase/Firebase.h"
#import "LIUBlogEntryModel.h"
#import "LIUMasterViewController.h"

//typedef void(^LIUInputCompletionHandler)(NSString *entryTitle, NSString *entryText, UIImage *entryMainImage, UIImage *entryThumbImage);

typedef void(^LIUInputCompletionHandler)(LIUBlogEntryModel *newEntry);

@interface LIUNewBlogEntryViewController : UIViewController <UITextFieldDelegate, UIImagePickerControllerDelegate,UINavigationControllerDelegate>


@property (copy, nonatomic) LIUInputCompletionHandler completionHandler;


@property (weak, nonatomic) IBOutlet UITextField *blogEntryTitle;
@property (weak, nonatomic) IBOutlet UIImageView *blogMainImage;
@property (weak, nonatomic) IBOutlet UITextView *blogEntryText;

@property (strong, nonatomic) UIImagePickerController *picker;



- (IBAction)addButtonTapped:(id)sender;

@end
