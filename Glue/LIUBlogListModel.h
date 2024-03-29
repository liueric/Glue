//
//  LIUBlogListModel.h
//  Glue
//
//  Created by Eric Liu on 5/2/14.
//  Copyright (c) 2014 ITP 342. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LIUBlogEntryModel.h"
#import "Firebase/Firebase.h"

@interface LIUBlogListModel : NSObject

@property NSMutableArray *personalBlogEntries;
@property NSMutableArray *feedBlogEntries;

+(instancetype)sharedModel;

@end
