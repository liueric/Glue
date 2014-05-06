//
//  LIUBlogListModel.m
//  Glue
//
//  Created by Eric Liu on 5/2/14.
//  Copyright (c) 2014 ITP 342. All rights reserved.
//

#import "LIUBlogListModel.h"

@implementation LIUBlogListModel

@synthesize personalBlogEntries = _personalBlogEntries;
@synthesize feedBlogEntries = _feedBlogEntries;

- (instancetype)init
{
    self = [super init];
    if (self) {
//            LIUBlogEntryModel *entry1 = [[LIUBlogEntryModel alloc] initWithEntry:@"First Day!" entry:@"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum." thumbImage:[UIImage imageNamed:@"image_placeholder.png"] mainImage:[UIImage imageNamed:@"image_placeholder.png"]];
//        
//            LIUBlogEntryModel *entry2 = [[LIUBlogEntryModel alloc] initWithEntry:@"Second Day!" entry:@"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum." thumbImage:[UIImage imageNamed:@"image_placeholder.png"] mainImage:[UIImage imageNamed:@"image_placeholder.png"]];
//        
//            LIUBlogEntryModel *entry3 = [[LIUBlogEntryModel alloc] initWithEntry:@"Third Day!" entry:@"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum." thumbImage:[UIImage imageNamed:@"image_placeholder.png"] mainImage:[UIImage imageNamed:@"image_placeholder.png"]];
//        
//            LIUBlogEntryModel *entry4 = [[LIUBlogEntryModel alloc] initWithEntry:@"Fourth Day!" entry:@"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum." thumbImage:[UIImage imageNamed:@"image_placeholder.png"] mainImage:[UIImage imageNamed:@"image_placeholder.png"]];
        
        //self.personalBlogEntries = [[NSMutableArray alloc] initWithObjects:entry1,entry2,entry3,entry4, nil];
        
        self.personalBlogEntries = [[NSMutableArray alloc] init];
        Firebase* personalListRef = [[Firebase alloc] initWithUrl:@"https://glue.firebaseio.com/PersonBlogFeed"];
        [personalListRef observeEventType:FEventTypeChildAdded withBlock:^(FDataSnapshot *snapshot) {
            NSDictionary* msgData = snapshot.value;
            NSLog(@"%@ says %@", msgData[@"user_id"], msgData[@"Text"]);
            LIUBlogEntryModel *personBlogEntry = [[LIUBlogEntryModel alloc] initWithEntry:msgData[@"Title"] entry:msgData[@"Text"] thumbImage:[UIImage imageNamed:@"image_placeholder.png"] mainImage:[UIImage imageNamed:@"image_placeholder.png"]];
        
            [self.personalBlogEntries addObject:personBlogEntry];
        }];
        
        self.feedBlogEntries = [[NSMutableArray alloc] init];
        Firebase* feedListRef = [[Firebase alloc] initWithUrl:@"https://glue.firebaseio.com/BlogFeed"];
        [feedListRef observeEventType:FEventTypeChildAdded withBlock:^(FDataSnapshot *snapshot) {
            NSDictionary* msgData = snapshot.value;
            NSLog(@"%@ says %@", msgData[@"user_id"], msgData[@"Text"]);
            LIUBlogEntryModel *personBlogEntry = [[LIUBlogEntryModel alloc] initWithEntry:msgData[@"Title"] entry:msgData[@"Text"] thumbImage:[UIImage imageNamed:@"image_placeholder.png"] mainImage:[UIImage imageNamed:@"image_placeholder.png"]];
            
           [self.feedBlogEntries addObject:personBlogEntry];
        }];
        
        
        
        
    }
    return self;
}

+(instancetype) sharedModel{
    static LIUBlogListModel *_sharedModel = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedModel = [[self alloc] init];
    });
    
    return _sharedModel;
}

@end
