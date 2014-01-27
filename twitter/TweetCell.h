//
//  TweetCell.h
//  twitter
//
//  Created by Timothy Lee on 8/6/13.
//  Copyright (c) 2013 codepath. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "Tweet.h"
#include "AsyncImageView/AsyncImageView.h"

@interface TweetCell : UITableViewCell

- (void)updateWithTweet:(Tweet*)tweet;

@end
