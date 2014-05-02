//
//  LIUBlogEntryModel.h
//  Glue
//
//  Created by Eric Liu on 5/1/14.
//  Copyright (c) 2014 ITP 342. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LIUBlogEntryModel : NSObject

@property (strong) NSString *blogTitle;
@property (strong) NSString *blogEntry;
@property (strong) UIImage *thumbImage;
@property (strong) UIImage *mainImage;

-(id)initWithEntry: (NSString *)blogTitle entry:(NSString *)blogEntry thumbImage:(UIImage *)thumbImage mainImage:(UIImage *)mainImage;

@end
