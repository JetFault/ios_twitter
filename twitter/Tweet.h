//
//  Tweet.h
//  twitter
//
//  Created by Timothy Lee on 8/5/13.
//  Copyright (c) 2013 codepath. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tweet : RestObject

@property (nonatomic, strong, readonly) NSURL *profilePictureURL;
@property (nonatomic, strong, readonly) NSString *displayName;
@property (nonatomic, strong, readonly) NSString *twitterHandle;
@property (nonatomic, strong, readonly) NSString *timestamp;
@property (nonatomic, strong, readonly) NSString *content;

@property (nonatomic, strong, readonly) NSNumber* retweets;
@property (nonatomic, strong, readonly) NSNumber* favourites;

+ (NSMutableArray *)tweetsWithArray:(NSArray *)array;

@end
