//
//  LIUBlogEntryModel.m
//  Glue
//
//  Created by Eric Liu on 5/1/14.
//  Copyright (c) 2014 ITP 342. All rights reserved.
//

#import "LIUBlogEntryModel.h"

@implementation LIUBlogEntryModel

@synthesize blogTitle = _blogTitle;
@synthesize blogEntry = _blogEntry;
@synthesize thumbImage = _thumbImage;
@synthesize mainImage = _mainImage;

-(id)initWithEntry:(NSString *)blogTitle entry:(NSString *)blogEntry thumbImage:(UIImage *)thumbImage mainImage:(UIImage *)mainImage{
    if ((self = [super init])) {
        self.blogTitle = blogTitle;
        self.blogEntry = blogEntry;
        self.thumbImage = thumbImage;
        self.mainImage = mainImage;
    }
    return self;
}
@end
