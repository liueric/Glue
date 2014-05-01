//
//  LIUDetailViewController.h
//  Glue
//
//  Created by Eric Liu on 5/1/14.
//  Copyright (c) 2014 ITP 342. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LIUDetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
