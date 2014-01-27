//
//  Tweet.m
//  twitter
//
//  Created by Timothy Lee on 8/5/13.
//  Copyright (c) 2013 codepath. All rights reserved.
//

#import "Tweet.h"

@implementation Tweet

- (NSString *)content {
    return [self.data valueOrNilForKeyPath:@"text"];
}

- (NSURL*)profilePictureURL
{
    return [NSURL URLWithString:[self.data valueOrNilForKeyPath:@"user.profile_image_url"]];
}

- (NSString*)screenName
{
    return [self.data valueOrNilForKeyPath:@"user.screen_name"];
}

- (NSString*)twitterHandle
{
    return [@"@" stringByAppendingString:[self.data valueOrNilForKeyPath:@"user.name"]];
}

- (NSString*)timestamp
{
    NSString* createdAt = [self.data valueOrNilForKeyPath:@"user.screen_name"];
    
    NSDate *now = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd hh:mm:ss"];
    NSDate *tweetCreatedDate = [dateFormatter dateFromString:createdAt];
    NSTimeInterval dateDifferenceInSeconds = [now timeIntervalSinceDate:tweetCreatedDate];
    tweetCreatedDate = [NSDate dateWithTimeIntervalSinceNow:dateDifferenceInSeconds];
    
    [dateFormatter setDoesRelativeDateFormatting:YES];
    NSString *dateString = [dateFormatter stringFromDate:tweetCreatedDate];
    
    NSLog(dateString);
    return dateString;
}

+ (NSMutableArray *)tweetsWithArray:(NSArray *)array {
    NSMutableArray *tweets = [[NSMutableArray alloc] initWithCapacity:array.count];
    for (NSDictionary *params in array) {
        [tweets addObject:[[Tweet alloc] initWithDictionary:params]];
    }
    return tweets;
}

@end
