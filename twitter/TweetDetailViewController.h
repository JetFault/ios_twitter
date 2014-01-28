//
//  TweetDetailViewController.h
//  twitter
//
//  Created by Jerry Reptak on 1/27/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tweet.h"
#import "AsyncImageView/AsyncImageView.h"

@interface TweetDetailViewController : UIViewController

@property (nonatomic, weak) Tweet *tweetModel;

@end
